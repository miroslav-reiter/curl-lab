# Normy API curl príklady

📘 Tento súbor obsahuje praktické príklady práce s verejným API ÚNMS SR pre normy, termíny, objednávky, faktúry, návštevnosť a typové schválenia meradiel.

Cieľom je precvičiť si príkaz `curl` na reálnych verejných dátach a naučiť sa pracovať s URL parametrami, HTTP hlavičkami, stavovými kódmi, výstupom do súboru a jednoduchým filtrovaním odpovedí.

## 📌 Základná adresa API

Oficiálna dokumentácia uvádza základnú URL adresu:

```text
https://www.normoff.gov.sk/api/
```

Portál noriem sa nachádza na adrese:

```text
https://normy.normoff.gov.sk/
```

Pri praktických príkladoch používame API adresu `https://www.normoff.gov.sk/api/`.

## 🎯 Čo budeme precvičovať

V tomto súbore si ukážeme:

- základnú GET požiadavku,
- vyhľadávanie termínov v normách,
- vyhľadávanie podľa slovenského a anglického jazyka,
- vyhľadávanie podľa presného čísla normy,
- čítanie objednávok podľa mesiaca a roka,
- čítanie faktúr podľa mesiaca a roka,
- čítanie analytiky návštevnosti,
- čítanie zoznamu článkov podľa obdobia,
- čítanie typových schválení meradiel,
- ukladanie odpovedí do JSON súborov,
- zobrazenie HTTP stavového kódu,
- rozdiely medzi Windows PowerShell a Linux Bash syntaxou.

## ⚙️ 1. Overenie dostupnosti curl

### Windows PowerShell

```powershell
curl.exe --version
```

### Ubuntu a Kali Linux

```bash
curl --version
```

Ak curl v Ubuntu alebo Kali Linuxe nie je dostupný, nainštalujeme ho takto:

```bash
sudo apt update
sudo apt install curl -y
```

## 🌐 2. Overenie dostupnosti API

### Windows PowerShell

```powershell
curl.exe -I https://www.normoff.gov.sk/api/
```

### Ubuntu a Kali Linux

```bash
curl -I https://www.normoff.gov.sk/api/
```

Prepínač `-I` zobrazí iba HTTP hlavičky. Používame ho na rýchle overenie, či server odpovedá.

## 🔎 3. Vyhľadávanie termínu v normách

Endpoint:

```text
GET /normy/{termín}/{typVyhľadávania}/{jazyk}/
```

Použiteľné hodnoty:

| Parameter | Hodnota | Význam |
|---|---|---|
| `termín` | hľadaný výraz | napríklad `testovanie`, `kvalita`, `meranie` |
| `typVyhľadávania` | `default` | fulltextové vyhľadávanie podľa relevancie |
| `typVyhľadávania` | `and` | výsledok musí obsahovať všetky zadané slová |
| `typVyhľadávania` | `or` | výsledok môže obsahovať aspoň jedno zo zadaných slov |
| `typVyhľadávania` | `norm` | presné vyhľadanie podľa čísla normy |
| `jazyk` | `sk` | slovenský jazyk |
| `jazyk` | `en` | anglický jazyk |

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

## 🇸🇰 4. Vyhľadávanie slovenského termínu

```powershell
curl.exe "https://www.normoff.gov.sk/api/normy/kvalita/default/sk/"
```

Linux:

```bash
curl "https://www.normoff.gov.sk/api/normy/kvalita/default/sk/"
```

## 🇬🇧 5. Vyhľadávanie anglického termínu

```powershell
curl.exe "https://www.normoff.gov.sk/api/normy/testing/default/en/"
```

Linux:

```bash
curl "https://www.normoff.gov.sk/api/normy/testing/default/en/"
```

## 🧠 6. Vyhľadávanie s logikou AND

Pri type `and` sa vyhľadávajú záznamy, ktoré obsahujú všetky zadané slová.

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/normy/riadenie%20kvality/and/sk/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/normy/riadenie%20kvality/and/sk/"
```

Znak medzery v URL zapisujeme ako `%20`.

## 🔀 7. Vyhľadávanie s logikou OR

Pri type `or` sa vyhľadávajú záznamy, ktoré obsahujú aspoň jedno zo zadaných slov.

```powershell
curl.exe "https://www.normoff.gov.sk/api/normy/meranie%20skúška/or/sk/"
```

Linux:

```bash
curl "https://www.normoff.gov.sk/api/normy/meranie%20skúška/or/sk/"
```

## 📏 8. Vyhľadávanie podľa presného čísla normy

Pri type `norm` zadávame presné číslo normy.

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/normy/STN%20EN%20589/norm/sk/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/normy/STN%20EN%20589/norm/sk/"
```

## 📥 9. Uloženie výsledku do JSON súboru

### Windows PowerShell

```powershell
curl.exe -L -o normy-testovanie.json "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

### Ubuntu a Kali Linux

```bash
curl -L -o normy-testovanie.json "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

## 🧾 10. Zobrazenie HTTP stavového kódu

### Windows PowerShell

```powershell
curl.exe -s -o NUL -w "%{http_code}" "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

### Ubuntu a Kali Linux

```bash
curl -s -o /dev/null -w "%{http_code}" "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

Výstup `200` znamená úspešnú odpoveď. Výstup `404` znamená, že pre danú požiadavku sa nenašli záznamy.

## 🧪 11. Verbose režim

Verbose režim pomáha pri diagnostike požiadavky.

### Windows PowerShell

```powershell
curl.exe -v "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

### Ubuntu a Kali Linux

```bash
curl -v "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

## 🛒 12. Čítanie objednávok podľa mesiaca a roka

Endpoint:

```text
GET /objednavky/{mesiac}/{rok}/
```

Príklad pre jún 2021:

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/objednavky/6/2021/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/objednavky/6/2021/"
```

Uloženie do súboru:

```powershell
curl.exe -L -o objednavky-2021-06.json "https://www.normoff.gov.sk/api/objednavky/6/2021/"
```

Linux:

```bash
curl -L -o objednavky-2021-06.json "https://www.normoff.gov.sk/api/objednavky/6/2021/"
```

## 💶 13. Čítanie faktúr podľa mesiaca a roka

Endpoint:

```text
GET /faktury/{mesiac}/{rok}/
```

Príklad pre jún 2021:

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/faktury/6/2021/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/faktury/6/2021/"
```

## 📊 14. Analytika návštevnosti webu

Endpoint:

```text
GET /navstevnost/{datumOd}/{datumDo}/{granularita}/
```

Povolené hodnoty parametra `granularita`:

| Hodnota | Význam |
|---|---|
| `daily` | denné údaje |
| `weekly` | týždenné údaje |
| `monthly` | mesačné údaje |

Príklad mesačnej návštevnosti:

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/navstevnost/2021-07-01/2021-12-31/monthly/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/navstevnost/2021-07-01/2021-12-31/monthly/"
```

Denná granularita má podľa dokumentácie obmedzený maximálny rozsah. Pri väčšom období použijeme `weekly` alebo `monthly`.

## 📰 15. Zobrazenia článkov podľa obdobia

Endpoint:

```text
GET /clanky/{datumOd}/{datumDo}/
```

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/clanky/2021-07-01/2021-07-31/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/clanky/2021-07-01/2021-07-31/"
```

## ⚖️ 16. Typové schválenia meradiel

Endpoint pre zoznam certifikátov:

```text
GET /typovky/{databáza}/
```

Dostupné databázy:

| Databáza | Význam |
|---|---|
| `tsq` | historické dokumenty od 1. januára 1993 do 7. mája 1998 |
| `cert` | historické dokumenty od 8. mája 1998 do 30. júna 2000 |
| `tsk` | dokumenty od 1. júla 2000 po súčasnosť |

Príklad:

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/typovky/tsk/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/typovky/tsk/"
```

## 🧭 17. Zoznam odborov merania

Endpoint:

```text
GET /typovkyOdbory/{databáza}/
```

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/typovkyOdbory/tsk/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/typovkyOdbory/tsk/"
```

## 🔍 18. Čítanie detailu certifikátu podľa ID

Endpoint:

```text
GET /typovky/{databáza}/{id}/
```

Príklad s ID `1`:

### Windows PowerShell

```powershell
curl.exe "https://www.normoff.gov.sk/api/typovky/tsk/1/"
```

### Ubuntu a Kali Linux

```bash
curl "https://www.normoff.gov.sk/api/typovky/tsk/1/"
```

Ak API vráti `404`, dané ID v databáze nemusí existovať.

## 🧰 19. Praktická cheat sheet tabuľka

| Úloha | Windows PowerShell | Ubuntu a Kali Linux |
|---|---|---|
| Overiť curl | `curl.exe --version` | `curl --version` |
| Overiť API hlavičky | `curl.exe -I https://www.normoff.gov.sk/api/` | `curl -I https://www.normoff.gov.sk/api/` |
| Vyhľadať termín | `curl.exe "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"` | `curl "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"` |
| Vyhľadať normu | `curl.exe "https://www.normoff.gov.sk/api/normy/STN%20EN%20589/norm/sk/"` | `curl "https://www.normoff.gov.sk/api/normy/STN%20EN%20589/norm/sk/"` |
| Uložiť odpoveď | `curl.exe -L -o vystup.json URL` | `curl -L -o vystup.json URL` |
| Zobraziť stavový kód | `curl.exe -s -o NUL -w "%{http_code}" URL` | `curl -s -o /dev/null -w "%{http_code}" URL` |
| Zobraziť hlavičky | `curl.exe -I URL` | `curl -I URL` |
| Verbose režim | `curl.exe -v URL` | `curl -v URL` |
| Tichý režim | `curl.exe -s URL` | `curl -s URL` |
| Nasledovať presmerovanie | `curl.exe -L URL` | `curl -L URL` |

## 🧪 20. Praktické cvičenia

### Cvičenie 1: Vyhľadáme termín v slovenčine

Vyhľadajte termín `testovanie` v slovenskom jazyku a uložte odpoveď do súboru `testovanie-sk.json`.

Windows:

```powershell
curl.exe -L -o testovanie-sk.json "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

Linux:

```bash
curl -L -o testovanie-sk.json "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

### Cvičenie 2: Vyhľadáme termín v angličtine

Vyhľadajte termín `testing` v anglickom jazyku.

```powershell
curl.exe "https://www.normoff.gov.sk/api/normy/testing/default/en/"
```

Linux:

```bash
curl "https://www.normoff.gov.sk/api/normy/testing/default/en/"
```

### Cvičenie 3: Skontrolujeme stavový kód

Overte, či endpoint pre termín `testovanie` vracia stavový kód `200`.

Windows:

```powershell
curl.exe -s -o NUL -w "%{http_code}" "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

Linux:

```bash
curl -s -o /dev/null -w "%{http_code}" "https://www.normoff.gov.sk/api/normy/testovanie/default/sk/"
```

### Cvičenie 4: Vyhľadáme presné číslo normy

Vyhľadajte normu `STN EN 589`.

```powershell
curl.exe "https://www.normoff.gov.sk/api/normy/STN%20EN%20589/norm/sk/"
```

Linux:

```bash
curl "https://www.normoff.gov.sk/api/normy/STN%20EN%20589/norm/sk/"
```

### Cvičenie 5: Uložíme objednávky do súboru

Stiahnite objednávky za jún 2021 do súboru `objednavky-2021-06.json`.

```powershell
curl.exe -L -o objednavky-2021-06.json "https://www.normoff.gov.sk/api/objednavky/6/2021/"
```

Linux:

```bash
curl -L -o objednavky-2021-06.json "https://www.normoff.gov.sk/api/objednavky/6/2021/"
```

## ⚠️ Poznámky k práci s URL

Pri medzerách v URL používame zápis `%20`. Napríklad výraz `riadenie kvality` zapíšeme ako `riadenie%20kvality`.

Pri diakritike odporúčame používať úvodzovky okolo celej URL adresy. Ak by terminál alebo shell spôsoboval problém, použijeme URL kódovanie znakov.

Ak API vráti `404`, nemusí ísť o chybu príkazu. Môže to znamenať, že pre dané parametre neexistujú žiadne záznamy.

## 🔒 Bezpečné používanie

Toto API používame na čítanie verejne dostupných údajov. Neposielame prihlasovacie údaje, tokeny ani osobné údaje do verejných ukážok.

Pri väčšom počte požiadaviek postupujeme ohľaduplne a zbytočne nezaťažujeme verejnú službu.

## 📚 Užitočné odkazy

- Dokumentácia API ÚNMS SR: https://www.normoff.gov.sk/api/
- Portál noriem: https://normy.normoff.gov.sk/
- Dokumentácia curl: https://curl.se/docs/
