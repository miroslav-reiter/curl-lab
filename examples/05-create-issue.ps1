# Vytvorenie GitHub issue cez POST požiadavku
# Token musí mať oprávnenie zapisovať issues.

curl.exe -X POST `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues `
  -d '{"title":"Test issue cez curl","body":"Toto issue bolo vytvorené cez curl vo Windows 11."}'
