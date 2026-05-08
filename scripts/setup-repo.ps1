# Skript na inicializáciu lokálneho Git repozitára a odoslanie na GitHub.
# Pred spustením vytvorte na GitHube prázdny repozitár:
# https://github.com/new
# Názov: curl-lab

git init
git add .
git commit -m "Initial curl testing lab"
git branch -M main
git remote add origin https://github.com/miroslav-reiter/curl-lab.git
git push -u origin main
