#import "lib.typ": *

#show: heh_template.with(
  campus_config_fn: campus.dst_config,
  print_config_fn: config.default_print_config.with(
    monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true",
  ),
  document_config_fn: config.default_document_config.with(
    doc_title: "Template HEH avec Typst",
    doc_description: "Template de document modulaire et universel au campus de la HEH.",
  ),
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
  caption: "c'est une image",
)

Texte qui s'affiche apres l'image... #lorem(24)

=== Citations
Un exemple de citation

#quote(
  attribution: "Robert C. Martin, Clean Code: A Handbook of Agile Software  Craftmanship",
  block: true,
  [FUNCTIONS SHOULD DO ONE THING. THEY SHOULD DO IT WELL. THEY SHOULD DO IT ONLY.],
)

Fin de citation...


=== Encadrements
Encadrements customs

#info[this is some content]
#hint[C'est un indice]
#important[C'est une info importante]
#silly[Petite information silly]

#pagebreak()

= Les Tableaux
Dans le heh-template, nous avons fait des tableaux en thème avec les couleurs des différents campus de la heh. le style est appliqué par défault si vous faites un simple tableau `#table()`.

Par exemple:
```typ
#table(
  columns: (50pt, 1fr, 1fr),
  table.header(
    [ID], [Nom], [Email]
  ),
  [1], [John Doe], [john.doe\@std.heh.be],
  [2], [John Doe], [john.doe\@std.heh.be],
  [3], [John Doe], [john.doe\@std.heh.be],
)
```
#table(
  columns: (50pt, 1fr, 1fr),
  table.header([ID], [Nom], [Email]),
  [1], [John Doe], [john.doe\@std.heh.be],
  [2], [John Doe], [john.doe\@std.heh.be],
  [3], [John Doe], [john.doe\@std.heh.be],
)

== Tableaux double entrées
Si vous voulez faire des tableaux a double entrées, vous pouvez importer directement `#double_table()` depuis heh-template

exemple:
```typ
#double_table(
  columns: (50pt, 1fr, 1fr),
  [], [A], [not A],
  [B], [O], [X],
  [not B], [X], [X]
)
```

#double_table(
  columns: (50pt, 1fr, 1fr),
  [],
  [A],
  [not A],
  [B],
  [O],
  [X],
  [not B],
  [X],
  [X],
)

#pagebreak()

== Tableaux Customs
Pour le moment, nous avons comme proposition que des tableaux simples et des tableaux a doubles entrées. Si vous souhaitez en faire avec un nombre x de headers ou encore faire d'autres choses avec vos tableaux, ça devient plus compliqué.

Pour vous aider, vous pouvez utiliser le state `campus_config_context` pour vous aider avec les couleurs de votre campus.

exemple de tableau custom:

```typ
#let custom_table(
  ..args
) = context {

    let primary_color = campus_config_context.get().style.primary_color

    show table.cell: it => {
    if(it.y <= 1 or it.x == 0) {
      set text(white, weight: "bold")
      it
    } else {
      it
    }
  }

  table(..args,     fill: (x, y) => {
    if (y <= 1 or x == 0) {
      primary_color.darken(40%)
    } else {
      primary_color.transparentize(90%)
    }
  })
}
```

Et son utilisation en pratique:
```typ
#custom_table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  table.cell(rowspan: 2)[],
  table.cell(colspan: 2)[2025],
  table.cell(colspan: 2)[2026],
  table.cell(colspan: 2)[Quad 1],
  [Quad 2], [Quad 3],
  [Rattrapage?],
  table.cell(colspan: 2)[Non],
  [Non],
  [Oui]
)
```

Ce qui donne:

#let custom_table(
  ..args,
) = context {
  let primary_color = campus_config_context.get().style.primary_color

  show table.cell: it => {
    if (it.y <= 1 or it.x == 0) {
      set text(white, weight: "bold")
      it
    } else {
      it
    }
  }

  table(..args, fill: (x, y) => {
      if (y <= 1 or x == 0) {
        primary_color.darken(40%)
      } else {
        primary_color.transparentize(90%)
      }
    })
}

#custom_table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  table.cell(rowspan: 2)[],
  table.cell(colspan: 2)[2025],
  table.cell(colspan: 2)[2026],
  table.cell(colspan: 2)[Quad 1],
  [Quad 2],
  [Quad 3],
  [Rattrapage?],
  table.cell(colspan: 2)[Non],
  [Non],
  [Oui],
)
