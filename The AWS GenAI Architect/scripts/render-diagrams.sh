#!/usr/bin/env bash
#
# render-diagrams.sh
#
# Renders Mermaid diagrams embedded in the book's chapter Markdown to SVG assets.
#
# Per requirement R4.8, Mermaid blocks inline in the chapters are the source of
# truth. This script produces the print ready SVGs from that source; it does not
# modify any Markdown. Re-run it whenever a chapter's diagrams change.
#
# Each fenced ```mermaid block is extracted in document order and rendered to:
#   images/<chapter-basename>-<NN>.svg
# for example chapters/chapter-06.md -> images/chapter-06-01.svg, chapter-06-02.svg
#
# Usage:
#   scripts/render-diagrams.sh                 # render diagrams in all chapters
#   scripts/render-diagrams.sh chapters/chapter-06.md [more.md ...]  # specific files
#
# Requirements: Node.js and npx (mermaid-cli is fetched via npx on demand).

set -euo pipefail

# Resolve the book root (the parent of this script's directory) so the script
# works regardless of the current working directory.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BOOK_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

CHAPTERS_DIR="${BOOK_ROOT}/chapters"
IMAGES_DIR="${BOOK_ROOT}/images"
MERMAID_CONFIG="${SCRIPT_DIR}/mermaid.config.json"

mkdir -p "${IMAGES_DIR}"

# Pick the files to process: explicit arguments, or every chapter Markdown file.
if [[ "$#" -gt 0 ]]; then
  files=("$@")
else
  files=()
  while IFS= read -r f; do
    files+=("$f")
  done < <(find "${CHAPTERS_DIR}" -maxdepth 1 -name '*.md' | sort)
fi

if [[ "${#files[@]}" -eq 0 ]]; then
  echo "No chapter Markdown files found to process."
  exit 0
fi

# mmdc runner: prefer a globally installed mmdc, otherwise fall back to npx.
if command -v mmdc >/dev/null 2>&1; then
  mmdc_cmd=(mmdc)
else
  mmdc_cmd=(npx --yes @mermaid-js/mermaid-cli)
fi

# mermaid-cli renders via a headless browser (Puppeteer). On Apple Silicon with an
# x64 Node build, Puppeteer's bundled Chrome runs under Rosetta and often times out.
# To use a local Chrome instead, set PUPPETEER_EXECUTABLE_PATH, for example:
#   export PUPPETEER_EXECUTABLE_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
# A Puppeteer config file is passed through when present so the browser path and
# launch args can be controlled without editing this script.
PUPPETEER_CONFIG="${SCRIPT_DIR}/puppeteer.config.json"

total_rendered=0

for md in "${files[@]}"; do
  if [[ ! -f "${md}" ]]; then
    echo "Skipping ${md}: not a file"
    continue
  fi

  base="$(basename "${md}" .md)"

  # Extract each fenced mermaid block into a temp .mmd file, in order.
  tmp_dir="$(mktemp -d)"
  # shellcheck disable=SC2064
  trap "rm -rf '${tmp_dir}'" EXIT

  awk -v out="${tmp_dir}" '
    /^```mermaid[[:space:]]*$/ { infence=1; n++; file=sprintf("%s/block-%02d.mmd", out, n); next }
    /^```[[:space:]]*$/ && infence { infence=0; next }
    infence { print > file }
  ' "${md}"

  # Render each extracted block.
  idx=0
  for block in "${tmp_dir}"/block-*.mmd; do
    [[ -e "${block}" ]] || continue
    idx=$((idx + 1))
    out_svg="$(printf '%s/%s-%02d.svg' "${IMAGES_DIR}" "${base}" "${idx}")"
    echo "Rendering ${base} diagram ${idx} -> images/$(basename "${out_svg}")"
    render_args=(-i "${block}" -o "${out_svg}" -b transparent)
    if [[ -f "${MERMAID_CONFIG}" ]]; then
      render_args+=(-c "${MERMAID_CONFIG}")
    fi
    if [[ -f "${PUPPETEER_CONFIG}" ]]; then
      render_args+=(-p "${PUPPETEER_CONFIG}")
    fi
    if ! "${mmdc_cmd[@]}" "${render_args[@]}"; then
      echo ""
      echo "ERROR: mermaid-cli failed to render ${base} diagram ${idx}."
      echo "This is usually a headless browser (Puppeteer) launch problem, not a"
      echo "problem with the diagram or this script. Common fixes on macOS:"
      echo "  1. Use an arm64 build of Node (nvm install --arch=arm64, or Homebrew arm64)."
      echo "  2. Point Puppeteer at a local Chrome:"
      echo "       export PUPPETEER_EXECUTABLE_PATH=\"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome\""
      echo "     or create scripts/puppeteer.config.json with an executablePath."
      exit 1
    fi
    total_rendered=$((total_rendered + 1))
  done

  if [[ "${idx}" -eq 0 ]]; then
    echo "No Mermaid diagrams found in ${base}.md"
  fi

  rm -rf "${tmp_dir}"
  trap - EXIT
done

echo "Done. Rendered ${total_rendered} diagram(s) to ${IMAGES_DIR}"
