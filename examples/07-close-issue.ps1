# Zatvorenie GitHub issue cez PATCH požiadavku

curl.exe -X PATCH `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues/1 `
  -d '{"state":"closed"}'
