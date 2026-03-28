@echo off
setlocal
:: Windowsの文字コードをUTF-8に設定
chcp 65001 >nul

echo ------------------------------------------
echo 🚀 AI Media Empire: One-Click Deployer
echo ------------------------------------------
echo.

:: スクリプトがあるフォルダへ移動
cd /d "%~dp0"

echo [1/4] 📦 Gitを初期化しています...
git init
git add .
git commit -m "Auto: Initial Setup for Crypto Empire"

echo [2/4] ☁️ GitHubにリポジトリ(empire-blog-second)を作成しています...
:: すでにリポジトリがある場合はエラーが出るが無視して進む
gh repo create empire-blog-second --public --push --source=. 2>nul || echo ⚠️ リポジトリが既に存在する可能性があります。送信を継続します...

echo [3/4] 🔐 APIキー(GeminiとResend)をクラウドに登録しています...
gh secret set GEMINI_API_KEY --body "AIzaSyDYFHzLkJeWJa2nGw13HDMs_2kJ9X1SdlA"
gh secret set RESEND_API_KEY --body "re_9z4CxxuP_CidMRZLLteCYD7J3MpaWN18V"

echo [4/4] 📤 データを送信しています...
git push -u origin main

echo.
echo ==========================================
echo ✅ デプロイ（アップロード）が完了しました！
echo ==========================================
echo.
echo 🌍 ブラウザで Vercel (https://vercel.com/) を開き、
echo    'empire-blog-second' を Import してください。
echo.
pause
