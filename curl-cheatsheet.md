# curl ťahák pre Windows 11

## Overenie verzie

```powershell
curl.exe --version
```

## GET

```powershell
curl.exe https://example.com
```

## HEAD

```powershell
curl.exe -I https://example.com
```

## Nasledovanie presmerovania

```powershell
curl.exe -L https://example.com
```

## Uloženie výstupu do súboru

```powershell
curl.exe -o vystup.html https://example.com
```

## Stiahnutie súboru s pôvodným názvom

```powershell
curl.exe -O https://example.com/subor.pdf
```

## Vlastná hlavička

```powershell
curl.exe -H "Accept: application/json" https://example.com/api
```

## POST s JSON telom

```powershell
curl.exe -X POST -H "Content-Type: application/json" -d '{"meno":"Miroslav"}' https://example.com/api
```

## Autentifikácia Bearer tokenom

```powershell
curl.exe -H "Authorization: Bearer $env:GITHUB_TOKEN" https://api.github.com/user
```

## Verbose režim

```powershell
curl.exe -v https://example.com
```

## Tichý režim

```powershell
curl.exe -s https://example.com
```

## Výpis stavového kódu

```powershell
curl.exe -s -o NUL -w "%{http_code}" https://example.com
```

## Častý problém vo Windows

V PowerShelli píšeme `curl.exe`, nie iba `curl`.
