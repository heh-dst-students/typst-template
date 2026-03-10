#import "lib.typ" : heh_template, config, campus, info, silly, important, hint

#show: heh_template.with(
  campus_config_fn: campus.dst_config,
  print_config_fn: config.default_print_config.with(monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"),
  document_config_fn: config.default_document_config.with(
    doc_title: "Template HEH avec Typst",
    doc_description: "Template de document modulaire et universel au campus de la HEH.",
    formation_name: none,
  )
)

= Hello there
#lorem(24)

== Listes a puces
Ceci est un exemple d'utilisation d'une liste a puce avec le template HEH Typst.

- Une Pomme
- Deux Poires
- Trois Fraises

=== Listes numérotées
C'est un exemple d'une liste numérotée faite avec le template HEH Typst.

+ Faire les courses
+ Préparer le repas
+ Faire la vaiselle

=== Liste de termes
Un exmple de liste de termes.

/ myrmécologie: Étude scientifique des fourmis.
/ gastre: Partie postérieure, plus ou moins globuleuse, formée de 4 anneaux, de l'abdomen des fourmis.
/ trophallaxie: Échange mutuel de nourriture entre membres d'une même colonie chez les insectes sociaux.

#pagebreak()

=== Exemple avec une image
Test de spacing avec une image au millieu du texte... #lorem(20)


#figure(
  image("/assets/logos/wbe.svg"),
  caption: "c'est une image"
)

Texte qui s'affiche apres l'image... #lorem(24)

=== Citations
Un exemple de citation

#quote(
  attribution: "Robert C. Martin, Clean Code: A Handbook of Agile Software  Craftmanship",
  block: true,
  [FUNCTIONS SHOULD DO ONE THING. THEY SHOULD DO IT WELL. THEY SHOULD DO IT ONLY.]
)

Fin de citation...


=== Encadrements
Encadrements customs

#info[this is some content]
#hint[C'est un indice]
#important[C'est une info importante]
#silly[Petite information silly]