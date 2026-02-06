demo_file := "demo.typ"

# Créer le PDF de démonstration
build-demo:
    typst compile {{ demo_file }}

# Compile le pdf de démonstration à chaque changement
watch-demo:
    typst watch {{ demo_file }}

