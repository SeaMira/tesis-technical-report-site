# Publicar en GitHub — pasos

Repositorio local: `D:\Users\Escritorio\U\Ot2026-2doSemM\tesis-technical-report-site`

URL prevista del sitio: **https://seamira.github.io/tesis-technical-report-site/**

---

## 1. Crear el repositorio en GitHub

1. Entra a [https://github.com/new](https://github.com/new)
2. **Repository name:** `tesis-technical-report-site`
3. **Description (opcional):** `GitHub Pages site for thesis technical report`
4. Elige **Public** (o Private si solo quieres lectores invitados al repo)
5. **No** marques “Add a README” ni “Add .gitignore” (ya existen localmente)
6. Clic en **Create repository**

---

## 2. Subir el código desde tu PC

En PowerShell:

```powershell
cd D:\Users\Escritorio\U\Ot2026-2doSemM\tesis-technical-report-site

git add mkdocs.yml .github .gitignore README.md scripts technical_report.md img
git commit -m "Add GitHub Pages site for technical report"
git remote add origin https://github.com/SeaMira/tesis-technical-report-site.git
git push -u origin main
```

> El primer push puede tardar varios minutos (~160 MB de imágenes).

Si GitHub rechaza algún archivo por tamaño (>100 MB), avísame y lo resolvemos con Git LFS o comprimiendo figuras.

---

## 3. Activar GitHub Pages

1. En el repo: **Settings** → **Pages**
2. En **Build and deployment** → **Source**, elige **GitHub Actions**
3. No hace falta elegir rama ni carpeta manualmente; el workflow `.github/workflows/pages.yml` lo hace todo

---

## 4. Verificar el deploy

1. Pestaña **Actions** del repo
2. Debe aparecer el workflow **“Deploy technical report to GitHub Pages”** en verde
3. Si falla, abre el run y revisa el log del job `build`
4. Cuando termine, en **Settings → Pages** verás la URL publicada

Abre: **https://seamira.github.io/tesis-technical-report-site/**

La primera publicación puede tardar 1–3 minutos después del workflow.

---

## 5. Compartir con lectores

| Objetivo | Qué hacer |
|----------|-----------|
| Cualquiera con el enlace | Repo público + compartir la URL |
| Solo personas concretas | Repo **privado** → **Settings → Collaborators** → invitar por correo |

---

## 6. Actualizar el informe después de cambios en la tesis

Cuando edites `technical_report.md` o figuras en `tesis-magister-latex`:

```powershell
cd D:\Users\Escritorio\U\Ot2026-2doSemM\tesis-technical-report-site
.\scripts\sync_from_thesis.ps1
git add technical_report.md img/
git commit -m "Sync technical report from thesis repo"
git push
```

GitHub Actions reconstruye y republica el sitio automáticamente.

---

## 7. Vista previa local (opcional)

```powershell
cd D:\Users\Escritorio\U\Ot2026-2doSemM\tesis-technical-report-site
.\scripts\sync_from_thesis.ps1
py -m pip install mkdocs-material
mkdir docs -Force
Copy-Item technical_report.md docs\index.md -Force
Copy-Item -Recurse img docs\img -Force
py -m mkdocs serve
```

Abre http://127.0.0.1:8000

---

## Si el nombre del repo en GitHub es distinto

Si usas otro nombre (ej. `technical-report`), actualiza en `mkdocs.yml`:

- `site_url`
- `repo_url`
- `repo_name`

Y la línea “Hosted copy” al inicio de `technical_report.md`.
