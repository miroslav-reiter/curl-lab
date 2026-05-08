# Autentifikovaná požiadavka na GitHub API
# Najprv nastavíme token:
# $env:GITHUB_TOKEN="VLOZTE_SEM_TOKEN"

curl.exe -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/user
