@echo off
echo Finalizing automated deploy...
cd /d "%~dp0"

:: 1. Initialize and ensure the branch name is 'main'
git init
git branch -M main

:: 2. Commit any new/changed files
git add .
git commit -m "initial"

:: 3. Create repo (if not already created)
gh repo create empire-blog-second --public --push --source=. 2>nul || echo Repository already exists.

:: 4. Set secrets (these should be set already, but doing again for safety)
gh secret set GEMINI_API_KEY --body "AIzaSyDYFHzLkJeWJa2nGw13HDMs_2kJ9X1SdlA"
gh secret set RESEND_API_KEY --body "re_9z4CxxuP_CidMRZLLteCYD7J3MpaWN18V"

:: 5. Push specifically to 'main'
git push -u origin main

echo Done!
pause
