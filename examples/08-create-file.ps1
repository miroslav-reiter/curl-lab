# Vytvorenie súboru cez GitHub Contents API
# Token musí mať oprávnenie contents:write.

$content = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("Súbor vytvorený cez curl."))
$body = @{
  message = "Create file via curl"
  content = $content
} | ConvertTo-Json

curl.exe -X PUT `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/curl-created.txt `
  -d $body
