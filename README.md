# curl-lab

🧪 Testovací repozitár na skúšanie príkazu `curl` vo Windows 11, Ubuntu a Kali Linuxe.

Repozitár je určený na praktické overovanie práce s `curl`, HTTP požiadavkami, GitHub REST API a najčastejšími prepínačmi priamo v termináli.

## 📌 Čo je curl

`curl` je nástroj príkazového riadka na odosielanie a prijímanie dát cez URL adresy. Používa sa najmä na komunikáciu so servermi, webovými stránkami, API rozhraniami a sieťovými službami.

Názov `curl` vychádza z výrazu client URL. V praxi ide o univerzálny nástroj, ktorým vieme z terminálu odoslať požiadavku na konkrétnu adresu, zobraziť odpoveď servera, odoslať dáta, pridať HTTP hlavičky, použiť autentifikáciu alebo stiahnuť súbor.

`curl` podporuje viacero protokolov, napríklad HTTP, HTTPS, FTP, FTPS, SFTP, SMTP, IMAP, POP3, MQTT a ďalšie. V tomto repozitári sa sústredíme najmä na HTTP, HTTPS a GitHub REST API.

## 🎯 Na čo sa curl používa v praxi

`curl` využívame pri vývoji, testovaní, administrácii serverov, automatizácii, práci s API a školeniach. Je vhodný najmä vtedy, keď potrebujeme rýchlo overiť komunikáciu so serverom bez webového prehliadača.

Typické praktické použitie:

- testovanie REST API endpointov,
- kontrola dostupnosti webovej stránky,
- zobrazenie HTTP stavových kódov,
- kontrola HTTP hlavičiek,
- testovanie GET, POST, PUT, PATCH a DELETE požiadaviek,
- odosielanie JSON dát na server,
- autentifikácia cez Bearer token,
- sťahovanie súborov,
- diagnostika presmerovaní,
- kontrola HTTPS komunikácie,
- automatizácia v skriptoch,
- testovanie GitHub REST API,
- základná sieťová diagnostika v Linuxe.

## 💻 Kde vieme curl používať

`curl` môžeme používať vo viacerých operačných systémoch a prostrediach:

| Prostredie | Použitie |
|---|---|
| Microsoft Windows 11 | PowerShell, Windows Terminal, Príkazový riadok |
| Microsoft Windows 10 | PowerShell, Windows Terminal, Príkazový riadok |
| Ubuntu Linux | Terminal, Bash, shell skripty |
| Kali Linux | Terminal, Bash, testovanie vlastných API a lokálnych služieb |
| macOS | Terminal, Zsh, Bash |
| GitHub Actions | Automatizované workflow skripty |
| Docker kontajnery | Testovanie služieb a API z izolovaného prostredia |
| CI/CD pipeline | Overovanie endpointov počas nasadzovania |

## 🧩 Čo si v tomto repozitári vyskúšame

Repozitár je určený na overovanie:

- GET požiadaviek,
- HEAD požiadaviek,
- HTTP hlavičiek,
- autentifikácie cez GitHub token,
- POST požiadaviek cez GitHub Issues API,
- PATCH požiadaviek cez GitHub Issues API,
- PUT požiadaviek cez GitHub Contents API,
- DELETE požiadaviek cez GitHub Contents API,
- sťahovania súborov cez raw URL,
- rozdielov medzi Windows PowerShell syntaxou a Linux Bash syntaxou.

## ⚙️ 1. Overenie curl vo Microsoft Windows 8/10/11

V PowerShelli odporúčame používať `curl.exe`:

```powershell
curl.exe --version
```

Dôvod je praktický. V niektorých verziách PowerShellu môže byť `curl` alias pre `Invoke-WebRequest`, ktorý sa správa inak ako skutočný `curl`. Preto je vo Windows bezpečnejšie používať príkaz `curl.exe`.

## 🐧 2. Overenie curl v Ubuntu Linuxe

V Ubuntu overíme dostupnosť príkazu:

```bash
curl --version
```

Ak curl nie je nainštalovaný, doplníme ho cez `apt`:

```bash
sudo apt update
sudo apt install curl -y
```

Následne overíme verziu:

```bash
curl --version
```

## 🐉 3. Overenie curl v Kali Linuxe

V Kali Linuxe overíme dostupnosť príkazu:

```bash
curl --version
```

Ak curl nie je nainštalovaný, doplníme ho cez `apt`:

```bash
sudo apt update
sudo apt install curl -y
```

Kali Linux môžeme použiť rovnako ako Ubuntu na prácu s terminálom, testovanie vlastných API, lokálnych služieb a verejne dostupných dokumentačných endpointov.

## 🌐 4. GET požiadavka na repozitár

### Windows PowerShell

```powershell
curl.exe https://api.github.com/repos/miroslav-reiter/curl-lab
```

### Ubuntu a Kali Linux

```bash
curl https://api.github.com/repos/miroslav-reiter/curl-lab
```

## 🧾 5. Zobrazenie HTTP hlavičiek

### Windows PowerShell

```powershell
curl.exe -I https://api.github.com/repos/miroslav-reiter/curl-lab
```

### Ubuntu a Kali Linux

```bash
curl -I https://api.github.com/repos/miroslav-reiter/curl-lab
```

## 📥 6. Stiahnutie raw JSON súboru

### Windows PowerShell

```powershell
curl.exe -L -o sample.json https://raw.githubusercontent.com/miroslav-reiter/curl-lab/main/data/sample.json
```

### Ubuntu a Kali Linux

```bash
curl -L -o sample.json https://raw.githubusercontent.com/miroslav-reiter/curl-lab/main/data/sample.json
```

## 📄 7. Zobrazenie obsahu súboru z GitHub Contents API

### Windows PowerShell

```powershell
curl.exe https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/sample.json
```

### Ubuntu a Kali Linux

```bash
curl https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/sample.json
```

## 🧠 8. Použitie vlastných hlavičiek

### Windows PowerShell

```powershell
curl.exe -H "Accept: application/vnd.github+json" https://api.github.com/repos/miroslav-reiter/curl-lab
```

### Ubuntu a Kali Linux

```bash
curl -H "Accept: application/vnd.github+json" https://api.github.com/repos/miroslav-reiter/curl-lab
```

## 🔍 9. Verbose režim

Verbose režim zobrazí technické detaily požiadavky a odpovede. Používame ho pri diagnostike problémov.

### Windows PowerShell

```powershell
curl.exe -v https://api.github.com/repos/miroslav-reiter/curl-lab
```

### Ubuntu a Kali Linux

```bash
curl -v https://api.github.com/repos/miroslav-reiter/curl-lab
```

## 🔐 10. Uloženie GitHub tokenu do premennej prostredia

Token nikdy neukladáme do repozitára.

### Windows PowerShell

```powershell
$env:GITHUB_TOKEN="VLOZTE_SEM_TOKEN"
```

### Ubuntu a Kali Linux

```bash
export GITHUB_TOKEN="VLOZTE_SEM_TOKEN"
```

## 👤 11. Autentifikovaná GET požiadavka

### Windows PowerShell

```powershell
curl.exe -H "Authorization: Bearer $env:GITHUB_TOKEN" -H "Accept: application/vnd.github+json" https://api.github.com/user
```

### Ubuntu a Kali Linux

```bash
curl -H "Authorization: Bearer $GITHUB_TOKEN" -H "Accept: application/vnd.github+json" https://api.github.com/user
```

## 📝 12. POST požiadavka: vytvorenie issue

### Windows PowerShell

```powershell
curl.exe -X POST `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues `
  -d '{"title":"Test issue cez curl","body":"Toto issue bolo vytvorené cez curl vo Windows 11."}'
```

### Ubuntu a Kali Linux

```bash
curl -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues \
  -d '{"title":"Test issue cez curl","body":"Toto issue bolo vytvorené cez curl v Linuxe."}'
```

## ✏️ 13. PATCH požiadavka: úprava issue

Číslo issue nahradíme skutočným číslom.

### Windows PowerShell

```powershell
curl.exe -X PATCH `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues/1 `
  -d '{"title":"Upravené issue cez curl","body":"Text bol upravený metódou PATCH."}'
```

### Ubuntu a Kali Linux

```bash
curl -X PATCH \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues/1 \
  -d '{"title":"Upravené issue cez curl","body":"Text bol upravený metódou PATCH."}'
```

## ✅ 14. PATCH požiadavka: zatvorenie issue

### Windows PowerShell

```powershell
curl.exe -X PATCH `
  -H "Authorization: Bearer $env:GITHUB_TOKEN" `
  -H "Accept: application/vnd.github+json" `
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues/1 `
  -d '{"state":"closed"}'
```

### Ubuntu a Kali Linux

```bash
curl -X PATCH \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/miroslav-reiter/curl-lab/issues/1 \
  -d '{"state":"closed"}'
```

## 📤 15. PUT požiadavka: vytvorenie súboru cez GitHub API

Obsah súboru musí byť kódovaný v Base64.

### Windows PowerShell

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

### Ubuntu a Kali Linux

```bash
CONTENT=$(printf "Súbor vytvorený cez curl." | base64 -w 0)

curl -X PUT \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/curl-created.txt \
  -d "{\"message\":\"Create file via curl\",\"content\":\"$CONTENT\"}"
```

## 🗑️ 16. DELETE požiadavka: odstránenie súboru cez GitHub API

Najprv získame SHA súboru.

### Windows PowerShell

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

### Ubuntu a Kali Linux

```bash
curl -H "Authorization: Bearer $GITHUB_TOKEN" https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/curl-created.txt
```

Potom použijeme získanú hodnotu `sha`:

```bash
curl -X DELETE \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/miroslav-reiter/curl-lab/contents/data/curl-created.txt \
  -d '{"message":"Delete file via curl","sha":"SEM_VLOZTE_SHA_SUBORU"}'
```

## 🧾 17. curl cheat sheet

| Cieľ | Windows PowerShell | Ubuntu a Kali Linux | Poznámka |
|---|---|---|---|
| Overenie verzie | `curl.exe --version` | `curl --version` | Zistíme dostupnosť a verziu nástroja. |
| GET požiadavka | `curl.exe URL` | `curl URL` | Základné získanie odpovede zo servera. |
| HTTP hlavičky | `curl.exe -I URL` | `curl -I URL` | Zobrazí iba hlavičky odpovede. |
| Nasledovanie presmerovania | `curl.exe -L URL` | `curl -L URL` | Dôležité pri presmerovaní z HTTP na HTTPS. |
| Uloženie do súboru | `curl.exe -o subor.txt URL` | `curl -o subor.txt URL` | Výstup uložíme pod vlastným názvom. |
| Stiahnutie s pôvodným názvom | `curl.exe -O URL` | `curl -O URL` | Použije názov súboru z URL. |
| Vlastná hlavička | `curl.exe -H "Accept: application/json" URL` | `curl -H "Accept: application/json" URL` | Používame pri API požiadavkách. |
| POST požiadavka | `curl.exe -X POST URL -d '{"key":"value"}'` | `curl -X POST URL -d '{"key":"value"}'` | Odosielanie dát na server. |
| PUT požiadavka | `curl.exe -X PUT URL -d '{"key":"value"}'` | `curl -X PUT URL -d '{"key":"value"}'` | Vytvorenie alebo nahradenie zdroja. |
| PATCH požiadavka | `curl.exe -X PATCH URL -d '{"key":"value"}'` | `curl -X PATCH URL -d '{"key":"value"}'` | Čiastočná úprava zdroja. |
| DELETE požiadavka | `curl.exe -X DELETE URL` | `curl -X DELETE URL` | Odstránenie zdroja. |
| Bearer token | `curl.exe -H "Authorization: Bearer $env:GITHUB_TOKEN" URL` | `curl -H "Authorization: Bearer $GITHUB_TOKEN" URL` | Autentifikácia cez token. |
| Verbose režim | `curl.exe -v URL` | `curl -v URL` | Diagnostika požiadavky. |
| Tichý režim | `curl.exe -s URL` | `curl -s URL` | Potlačí priebehové informácie. |
| Stavový kód | `curl.exe -s -o NUL -w "%{http_code}" URL` | `curl -s -o /dev/null -w "%{http_code}" URL` | Vráti iba HTTP stavový kód. |

## 🔒 Bezpečnostné poznámky

Vo Windows PowerShelli používame radšej `curl.exe`, nie iba `curl`, aby sme sa vyhli konfliktu s aliasom.

GitHub token musí mať príslušné oprávnenia. Na vytváranie issues stačí oprávnenie pre issues. Na zápis súborov do repozitára treba oprávnenie `contents:write`.

Token nikdy neukladáme do súborov, commitov ani verejného repozitára. Neposielame ho do verejných ukážok.

Pri testovaní pracujeme iba s vlastnými systémami, testovacími prostrediami alebo službami, ku ktorým máme oprávnenie.

## 📚 Užitočné odkazy

- Oficiálna stránka curl: https://curl.se/
- Dokumentácia curl: https://curl.se/docs/
- GitHub REST API dokumentácia: https://docs.github.com/en/rest
- GitHub REST API Issues: https://docs.github.com/en/rest/issues/issues
- GitHub REST API Contents: https://docs.github.com/en/rest/repos/contents
