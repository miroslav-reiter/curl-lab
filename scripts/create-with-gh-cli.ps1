# Alternatíva: vytvorenie repozitára cez GitHub CLI.
# Vyžaduje nainštalovaný nástroj gh:
# https://cli.github.com/

gh auth login
gh repo create miroslav-reiter/curl-lab --public --description "Testovací repozitár na skúšanie curl príkazov, HTTP metód a GitHub REST API" --source=. --remote=origin --push
