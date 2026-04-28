demo_file := "manuel.typ"

alias b := build-manuel
alias w := watch-manuel

alias bm := build-monochrome
alias wm := watch-monochrome

alias fmt := format

# Créer le PDF de démonstration (manuel)
build-manuel:
    typst compile {{ demo_file }}

# Compile le pdf de démonstration (manuel) à chaque changement
watch-manuel:
    typst watch {{ demo_file }}

# Créer le manuel PDF en monochrome
build-monochrome:
    typst compile --input monochrome=true {{ demo_file }}

# Compile le PDF monochrome a chaque changement
watch-monochrome:
    typst watch --input monochrome=true {{ demo_file }}

# Formatte le code avec typstyle
format:
    typstyle -i .
