# Diagram rendering

Mermaid diagrams live inline in the chapter Markdown under `chapters/`. Per
requirement R4.8, those inline blocks are the source of truth. This directory
holds the tooling that renders them to print ready SVGs in `../images/`.

## Usage

```bash
# Render diagrams in every chapter
scripts/render-diagrams.sh

# Render diagrams in specific chapters
scripts/render-diagrams.sh chapters/chapter-06.md chapters/chapter-07.md
```

Output is written to `images/<chapter>-<NN>.svg`, numbered by the order the
diagrams appear in the file (for example `chapter-06-01.svg`, `chapter-06-02.svg`).

The script never edits Markdown. Re-run it whenever a chapter's diagrams change.

## Requirements

- Node.js and `npx` (the script fetches `@mermaid-js/mermaid-cli` via `npx` on
  demand; a global `mmdc` is used instead if present).

## macOS / Apple Silicon note

`mermaid-cli` renders through a headless browser (Puppeteer). On Apple Silicon,
an **x64 build of Node** launches Chrome under Rosetta and the browser handshake
times out, so rendering fails even though the script and diagrams are correct.

To fix, use an **arm64 build of Node**, for example:

```bash
# with nvm
nvm install --arch=arm64 <version>
nvm use <version>

# or via arm64 Homebrew
/opt/homebrew/bin/brew install node
```

Optionally, `puppeteer.config.json` points Puppeteer at a locally installed
Chrome. This is used automatically when present, but it does not by itself
resolve the x64-Node-on-arm64 timeout above; the arm64 Node build is the real
fix.

## Files

- `render-diagrams.sh` — extracts Mermaid blocks and renders them to SVG.
- `mermaid.config.json` — Mermaid theme and per diagram type options.
- `puppeteer.config.json` — local Chrome path and launch args for Puppeteer.
