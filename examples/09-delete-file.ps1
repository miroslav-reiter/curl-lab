# Odstránenie súboru cez GitHub Contents API
# Najprv získame SHA súboru:
# curl.exe -H "Authorization: Bearer $env:GITHUB_TOKEN" https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/curl-created.txt

$body = @{
  message = "Delete file via curl"
  sha = "SEM_VLOZTE_SHA_SUBORU"
} | ConvertTo-Json

curl.exe -X DELETE `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/curl-created.txt `
  -d $body
