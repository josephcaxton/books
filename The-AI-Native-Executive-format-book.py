import os
import glob
import markdown2
from weasyprint import HTML, CSS

# 1. Combine Markdown files in order
markdown_files = sorted(glob.glob("The AI-Native Executive/*.md"))
combined_md = ""

for file_path in markdown_files:
    with open(file_path, "r", encoding="utf-8") as f:
        combined_md += f.read() + "\n\n<div class='page-break'></div>\n\n"

# 2. Convert Markdown to HTML
html_content = markdown2.markdown(combined_md, extras=["tables", "fenced-code-blocks", "header-ids"])

# 3. Apply Custom KDP Print Layout CSS matching reference
css_style = """
@page {
    size: 6in 9in;
    margin-top: 0.75in;
    margin-bottom: 0.75in;
    margin-left: 0.75in;
    margin-right: 0.625in;

    @bottom-center {
        content: counter(page);
        font-family: 'Helvetica Neue', Arial, sans-serif;
        font-size: 9pt;
        color: #555;
    }
}

@page:left {
    margin-left: 0.75in; /* Inside gutter for binding */
    margin-right: 0.625in;
}

@page:right {
    margin-left: 0.625in;
    margin-right: 0.75in; /* Inside gutter for binding */
}

body {
    font-family: 'Georgia', 'Times New Roman', serif;
    font-size: 10.5pt;
    line-height: 1.5;
    color: #111111;
    text-align: justify;
    hyphens: auto;
}

/* Chapter Headings - Styled like reference PDF */
h1 {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    font-weight: 900;
    font-size: 26pt;
    text-transform: uppercase;
    letter-spacing: -0.5px;
    line-height: 1.1;
    margin-top: 2in;
    margin-bottom: 1.5rem;
    page-break-before: always;
}

h2 {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    font-weight: 700;
    font-size: 14pt;
    text-transform: uppercase;
    margin-top: 1.5rem;
    margin-bottom: 0.75rem;
}

h3 {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    font-weight: 600;
    font-size: 11pt;
    margin-top: 1rem;
    margin-bottom: 0.5rem;
}

p {
    text-indent: 1.25em;
    margin-top: 0;
    margin-bottom: 0;
}

/* Remove indent for first paragraph after headings */
h1 + p, h2 + p, h3 + p, blockquote + p {
    text-indent: 0;
}

/* Page Break Utility */
.page-break {
    page-break-after: always;
}

/* Tables Formatting */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 1.5rem 0;
    font-size: 9.5pt;
}

th, td {
    border-bottom: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    font-weight: bold;
    background-color: #f8f8f8;
}
"""

# 4. Generate Final Print PDF
full_html = f"<html><head><style>{css_style}</style></head><body>{html_content}</body></html>"
HTML(string=full_html).write_pdf("The_AI_Native_Executive_KDP_Print.pdf")
print("Print-Ready PDF Generated Successfully!")
