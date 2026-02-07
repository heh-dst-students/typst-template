demo_file := "demo.typ"

alias b := build-demo
alias w := watch-demo

alias bm := build-monochrome
alias wm := watch-monochrome

# Créer le PDF de démonstration
build-demo:
    typst compile {{ demo_file }}

# Compile le pdf de démonstration à chaque changement
watch-demo:
    typst watch {{ demo_file }}

# Créer le PDF de démonstration en monochrome
build-monochrome:
    typst compile --input monochrome=true {{ demo_file }}

# Compile le PDF monochrome a chaque changement
watch-monochrome:
    typst watch --input monochrome=true {{ demo_file }}

