# curl-lab

Testovací repozitár na skúšanie príkazu curl vo Windows 11.

Repozitár je určený na overovanie:
- GET požiadaviek
- HEAD požiadaviek
- HTTP hlavičiek
- autentifikácie cez GitHub token
- POST požiadaviek cez GitHub Issues API
- PATCH požiadaviek cez GitHub Issues API
- PUT požiadaviek cez GitHub Contents API
- DELETE požiadaviek cez GitHub Contents API
- sťahovania súborov cez raw URL

## 1. Overenie curl vo Microsfot Windows 8/10/11

V PowerShelli odporúčame používať `curl.exe`:

```powershell
curl.exe --version
```

## 2. GET požiadavka na repozitár

```powershell
curl.exe https://api.github.com/repos/miroslav-reiter/curl-lab
```

## 3. Zobrazenie HTTP hlavičiek

```powershell
curl.exe -I https://api.github.com/repos/miroslav-reiter/curl-lab
```

## 4. Stiahnutie raw JSON súboru

```powershell
curl.exe -L -o sample.json https://raw.githubusercontent.com/miroslav-reiter/curl-lab/main/data/sample.json
```

## 5. Zobrazenie obsahu súboru z GitHub Contents API

```powershell
curl.exe https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/sample.json
```

## 6. Použitie vlastných hlavičiek

```powershell
curl.exe -H "Accept: application/vnd.github+json" https://api.github.com/repos/miroslav-reiter/curl-lab
```

## 7. Verbose režim

```powershell
curl.exe -v https://api.github.com/repos/miroslav-reiter/curl-lab
```

## 8. Uloženie GitHub tokenu do premennej prostredia

Token nikdy neukladáme do repozitára.

```powershell
$env:GITHUB_TOKEN="VLOZTE_SEM_TOKEN"
```

## 9. Autentifikovaná GET požiadavka

```powershell
curl.exe -H "Authorization: Bearer $env:GITHUB_TOKEN" -H "Accept: application/vnd.github+json" https://api.github.com/user
```

## 10. POST požiadavka: vytvorenie issue

```powershell
curl.exe -X POST `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues `
  -d '{"title":"Test issue cez curl","body":"Toto issue bolo vytvorené cez curl vo Windows 11."}'
```

## 11. PATCH požiadavka: úprava issue

Číslo issue nahradíme skutočným číslom.

```powershell
curl.exe -X PATCH `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues/1 `
  -d '{"title":"Upravené issue cez curl","body":"Text bol upravený metódou PATCH."}'
```

## 12. PATCH požiadavka: zatvorenie issue

```powershell
curl.exe -X PATCH `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues/1 `
  -d '{"state":"closed"}'
```

## 13. PUT požiadavka: vytvorenie súboru cez GitHub API

Obsah súboru musí byť kódovaný v Base64.

```powershell
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
```

## 14. DELETE požiadavka: odstránenie súboru cez GitHub API

Najprv získame SHA súboru:

```powershell
curl.exe -H "Authorization: Bearer $env:GITHUB_TOKEN" https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/curl-created.txt
```

Potom súbor odstránime. Hodnotu SHA treba nahradiť reálnou hodnotou z predchádzajúcej odpovede.

```powershell
$body = @{
  message = "Delete file via curl"
  sha = "SEM_VLOZTE_SHA_SUBORU"
} | ConvertTo-Json

curl.exe -X DELETE `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/curl-created.txt `
  -d $body
```

## 15. Najpoužívanejšie prepínače curl

```powershell
curl.exe -I URL
curl.exe -L URL
curl.exe -o subor.txt URL
curl.exe -O URL
curl.exe -H "Nazov-Hlavicky: hodnota" URL
curl.exe -X POST URL
curl.exe -d '{"key":"value"}' URL
curl.exe -v URL
curl.exe -s URL
curl.exe -u meno:heslo URL
```

## Poznámky

Vo Windows PowerShelli používame radšej `curl.exe`, nie iba `curl`, aby sme sa vyhli konfliktu s aliasom.

GitHub token musí mať príslušné oprávnenia. Na vytváranie issues stačí oprávnenie pre issues. Na zápis súborov do repozitára treba oprávnenie `contents:write`.

Token nikdy neukladáme do súborov, commitov ani verejného repozitára.
