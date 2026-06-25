# Technical Report — GitHub Pages site

Static site for the long-form technical report (companion to thesis Chapter 4).

**Source of truth:** `../tesis-magister-latex/technical_report.md` and `../tesis-magister-latex/img/`.

## Local preview

```powershell
cd D:\Users\Escritorio\U\Ot2026-2doSemM\tesis-technical-report-site
.\scripts\sync_from_thesis.ps1
pip install mkdocs-material
mkdir docs
Copy-Item technical_report.md docs\index.md
Copy-Item -Recurse img docs\img
mkdocs serve
```

Open http://127.0.0.1:8000

## Update content after editing the thesis report

```powershell
.\scripts\sync_from_thesis.ps1
git add technical_report.md img/
git commit -m "Sync technical report from thesis repo"
git push
```

GitHub Actions rebuilds and publishes the site automatically.

## Repository layout

| Path | Purpose |
|------|---------|
| `technical_report.md` | Synced copy of the report |
| `img/` | Synced figures (`img/chapter3/...`) |
| `mkdocs.yml` | Site theme and Markdown extensions |
| `.github/workflows/pages.yml` | Build & deploy to GitHub Pages |
| `scripts/sync_from_thesis.ps1` | Refresh content from sibling thesis repo |

Published URL (after setup): **https://seamira.github.io/tesis-technical-report-site/**
