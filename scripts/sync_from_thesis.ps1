# Copy technical_report.md and img/ from the LaTeX thesis repo into this site repo.
# Run from the site repo root:  .\scripts\sync_from_thesis.ps1

$ErrorActionPreference = "Stop"

$SiteRoot = Split-Path -Parent $PSScriptRoot
$ThesisRoot = Join-Path (Split-Path -Parent $SiteRoot) "tesis-magister-latex"

$ReportSrc = Join-Path $ThesisRoot "technical_report.md"
$ImgSrc = Join-Path $ThesisRoot "img"
$ReportDst = Join-Path $SiteRoot "technical_report.md"
$ImgDst = Join-Path $SiteRoot "img"

if (-not (Test-Path $ReportSrc)) {
    Write-Error "Not found: $ReportSrc"
}

Write-Host "Syncing from: $ThesisRoot"
Copy-Item -Path $ReportSrc -Destination $ReportDst -Force

if (Test-Path $ImgDst) {
    Remove-Item -Path $ImgDst -Recurse -Force
}
Copy-Item -Path $ImgSrc -Destination $ImgDst -Recurse -Force

Write-Host "Done."
Write-Host "  technical_report.md"
Write-Host "  img/ ($(@(Get-ChildItem $ImgDst -Recurse -File).Count) files)"
