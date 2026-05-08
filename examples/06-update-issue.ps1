# Úprava GitHub issue cez PATCH požiadavku
# Číslo issue /1 nahraďte podľa potreby.

curl.exe -X PATCH `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues/1 `
  -d '{"title":"Upravené issue cez curl","body":"Text bol upravený metódou PATCH."}'
