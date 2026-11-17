# -------------------------------------------------
# deploy.ps1 – publish your static site to GitHub Pages
# -------------------------------------------------

# 1️⃣ Move to the project folder
Set-Location "C:\Users\Havz\portofolio"

# 2️⃣ Initialize a Git repo if one doesn't exist yet
if (-not (Test-Path ".git")) {
    git init
    Write-Host "Git repository initialized"
}

# 3️⃣ Stage all files (including .gitignore)
git add .

# 4️⃣ Commit (skip if there are no changes)
# The commit command will fail if there are no changes; we ignore the error.
git commit -m "Initial static‑site commit" | Out-Null
Write-Host "Changes committed"

# 5️⃣ Add the remote (replace if it already exists)
$remote = "https://github.com/DreamWasSmiling/Starlights-site.git"
# Remove existing origin if present
git remote remove origin -ErrorAction SilentlyContinue
git remote add origin $remote
Write-Host "Remote 'origin' set to $remote"

# 6️⃣ Push to GitHub (creates the main branch)
git branch -M main
git push -u origin main
Write-Host "Push complete - your code is now on GitHub"

# -------------------------------------------------
# After the push, complete the following UI steps:
# -------------------------------------------------
# 1️⃣ Open https://github.com/DreamWasSmiling/Starlights-site/settings/pages
# 2️⃣ Under **Source**, select **Branch: main** and **Folder: / (root)** → **Save**
# 3️⃣ In the same page, under **Custom domain**, type **starlights.my.id** → **Save**
# 4️⃣ GitHub will display the DNS records you must add (see below).
