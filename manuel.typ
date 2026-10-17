#import "./lib.typ": (
  config, double_table, heh_config, heh_document_template, hint, important, info,
)

#show: heh_document_template.with(
  document_config_fn: config.default_document_config.with(
    doc_title: "Documentation de HEH-Template",
    doc_description: "Démonstration et documentation du template",
    formation_name: none,
    orientation_name: none,
    authors: (
      ("Contributeurs de HEH-Template", ""),
    ),
  ),
  print_config_fn: config.default_print_config.with(
    monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true",
  ),
)

= Utilisation basique

Pour utiliser le template, commencez par le télécharger dans le dossier de vos paquets locaux typst. Ici par exemple, sous `heh-template/1.0.0`. Pour respecter la charte graphique HEH, la *police utilisée est Roboto*, pensez donc à l'installer aussi.

Afin que le style sout appliqué en entier, utilisez une directive `show` globale au document:

```typst
#import "@preview/heh-template:1.0.0" : heh_document_template, campus, config

// Appel du template en utilisant le style du département technique (DST)
#show: heh_document_template.with(
  campus_config_fn: campus.dst_config,
  document_config_fn: config.default_document_config
)

= Premier titre

```

= Configuration du document

Pour modifier la configuration du document, vous devez modifier la fonction `default_document_config` avec `.with()` pour changer ses paramètres par défaut. Par exemple:

```typst
#import "@preview/heh-template:1.0.0" : heh_document_template, campus, config

// Appel du template en utilisant le style du département technique (DST)
#show: heh_document_template.with(
  campus_config_fn: campus.dst_config,
  document_config_fn: config.default_document_config.with(
    doc_title: "Titre", // Titre du document
    doc_description: "Description", // Description du document
    formation_name: "Bachelier en Informatique", // Nom de la formation
    orientation_name: "Orientation développement", // Orientation / sous-titre de la formation
    year: "2025 - 2026", // Année académique
    authors: ( // Liste contentn le prenom/nom des auteurs avec leur email
      ("Prenom Nom", "prenom.nom@std.heh.be"),
      ("Xy Z", "xy.z@std.heh.be"),
    ),
  )
)

// Reste du document

= Premier titre
```

= Style du document

Comme paramètre pour `campus_config_fn`, vous pouvez choisir parmi les différents départements de la HEH.

- `dst_config` : Département des sciences et technologies
- `dss_ms_config` : Département des sciences sociales (Mons)
- `dss_to_config` : Département des sciences sociales (Tournai)
- `dsee_ms_config` : Département des sciences de l'éducation et de l'enseignement (Mons)
- `dsee_to_config` : Département des sciences de l'éducation et de l'enseignement (Tournai)
- `deco_config` : Département des sciences juridiques, économiques et de gestion


= Configuration de l'impression / des pages

Les données de configuration des pages / du document se trouvent dans `print_config_fn` qui peut être modifiée de la même façon que `document_config_fn`. Par exemple:

```typst
...
#show: heh_document_template.with(
    ...
    print_config_fn: default_print_config.with(
      monochrome: false, // Si `true`, le document sera affiché uniquement en nuances de gris,
      monochromeimages: true, // Si `true` et que le mode monochrome est activé, transforme automatiquement toutes les images du document en nuances de gris,

      outlines: (
        config.outlines.headings,
        config.outlines.tables,
        config.outlines.images,
      ), // Une liste de dictionnaires avec 'target' comme sélecteur et 'title' pour le titre de la table.

      font: "Roboto", // Police d'écriture du document,
      lang: "fr", // Langage du document
    )
)
...
```

#important[
  Le paramètre `monochromeimages` utilise un module externe pour transformer les images en nuances de gris. La conversion peut prendre un certain temps lors de la compilation.

  Les images à convertir doivent être spécifiées avec un `path` comme ceci: `#image(path("image.png"))`
]

#hint[
  Pour définir le paramètre `monochrome` plus simplement, vous pouvez utilise `sys.inputs` et compiler le fichier avec `--input monochrome=true`

  ```typst
  ...
  monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"
  ...
  ```
]

#hint[
  Pour désactiver la table des matières, vous pouvez définir la valeur de `outline` a *`none`*. Si une partie de la table des matières n'a rien a afficher (pas de tableaux, d'images, d'en-têtes, ...), elle ne s'affichera pas.
  ```typst
  outlines: none, // désactive la table des matières
  ```
]

#hint[
  Vous pouvez également importer certaines tables des matières préfaites pour vous depuis la variable `config.outlines` afin de gagner du temps et de la lisiblité sur votre document:
  - `config.outlines.headings`
  - `config.outlines.tables`
  - `config.outlines.images`
  ```typst
  outlines: (config.outlines.headings, ) // ATTENTION! La virgule est nécéssaire
  ```
]

= Configuration des pieds de page et en-têtes

Les pieds et en-têtes de page n'étant pas standards pour toute la HEH, le template propose *plusieurs styles* et vous permet de définir les vôtres facilement en modifiant les paramètres `header_style` et `footer_style` de `heh_document_template`. Vous pouvez également y rajouter des paramètres supplémentaires en utilisant la fonction `.with()` sur la fonction du header / footer

== Exemple de changement de footers

```typst
#import "@preview/heh-template:1.0.0" : headers, footers, ...
...
#show: heh_document_template.with(
    ...
    header_style: headers.year_title, // Affiche l'année académique et le titre
    header_extra_params: (),
    footer_style: footer.page_numbers.with(
      show_total: false
    ), // Affiche les numéros de pages (sans le total)
)
...

```

== Définition d'une fonction personalisée (headers / footers)

```typst
#import "@preview/heh-template:1.0.0": ..., heh_config
...
#let myheader(
  show_logo: false
) = context {
  // Accès à config.campus, config.document et config.print
  let config = heh_config.get()
}

#show: heh_document_template.with(
    ...
    header_style: myheader.with(show_logo: true),
)
```

== Liste des footers

- Numéros de page (@footers-no)
- Numéros de page avec indicateur de côté (@footers-no-sided)

=== Numéros de page <footers-no>

Affiche les numéros de page à droite de la page

```typst
...
footer_style: footers.page_numbers
...
```

==== Paramètres

- `show_total`: Affiche le nombre total de pages du document à coté (par défaut)

=== Numéros de page avec indicateur de coté <footers-no-sided>

Affiche les numéros de page à gauche ou à droite de la page, selon la ou elle devrait être imprimée (page de gauche => gauche, page de droite => droite)

```typst
...
footer_style: footers.page_numbers_side
...
```

==== Paramètres

- `show_total`: Affiche le nombre total de pages du document à coté (par défaut)

== Liste des headers

- Logo, année et titre @logo-year-title
- Année académique et titre @year-title

=== Logo, année et titre <logo-year-title>

Affiche le logo a gauche et l'année académique / le titre à droite

```typst
header_style: headers.logo_year_title
```

==== Paramètres `.with()`

- `bool show_year`: Affiche l'année acadamique (par défaut)
- `bool show_title`: Affiche le titre du document (par défaut)

=== Année académique et titre <year-title>

Affiche le titre et l'année académique (par défaut le titre à gauche et l'année à droite)

```typst
...
header_style: headers.year_title
...
```

==== Paramètres (`.with()`)

- `bool title_left`: Affiche le titre à gauche (par défaut)

= Modifier les configurations d'un campus

Si vous souhaitez modifier les configurations d'un campus (changer les noms, les couleurs, ...), vous pouvez utiliser les versions modifiées de `**_naming_config`, `**_style_config` et `**_contact_config`.

Voici le schéma des configurations:

```typst
(
  naming: (
    short_name: "DST",
    full_name: "Département des sciences et technologies",
    logo_title: "Sciences",
    logo_subtitle: "et technologies",
  ),
  contact: (
    address_line1: "Avenue Victor Maistriau 8a",
    address_line2: "B-7000 Mons",
    phone_nr_pretty: "+32 (0)65 33 81 54",
    phone_nr_short: "+3265338154",
    mail: "scitech-mons@heh.be",
  ),
  style: (
    decorations_color: rgb("#2f5496"),
    primary_color: rgb("#e41513"),
    onprimary_color: rgb("#ffffff"),
  ),
)
```

== Exemple: modification des noms

```typst
...
campus_config_fn: campus.dst_config.with(
    naming: campus.dst_naming_config.with(
        full_name: "Département des technologies et sciences"
    )
)
...
```

= Fonctionnalités du template

== Tableaux

Le template propose des tableaux stylysés avec les couleurs des différents campus de la HEH. Le style est appliqué par défaut pour les tableaux créés avec `#table()`

Dans le heh-template, nous avons stylisé des tableaux en thème avec les couleurs des différents campus de la heh. le style est appliqué par défault si vous faites un simple tableau `#table()`.

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

Si vous voulez utiliser des tableaux a double entrée, vous pouvez importer directement `#double_table()` depuis heh-template

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

== Tableaux personalisés

Pour l'instant, le template ne propose que des tableaux à simple et à double entrée. Si vous souhaitez pousser la modification des tableaux, vous pouvez créer vos propres fonctions:

Vous pouvez utiliser le `state` `heh_config` qui contient l'ensemble de la configuration du document

```typ
#let custom_table(
  ..args
) = context {

    let primary_color = heh_config.get().campus.style.primary_color

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

#block(breakable: false)[
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
]
#let custom_table(
  ..args,
) = context {
  let primary_color = heh_config.get().campus.style.primary_color

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

== Boites (information / important / ...)

Boites d'information, avertissement, d'astuces, ... pour mettre en évidence du texte

Pour les utilisez, importez les fonctions `info`, `important` ou `hint` depuis le template.

=== Exemple

```typst
#import "@preview/heh-template:1.0.0" : info, important, hint

#info[Information utile]
#hint[N'oubliez pas que vous pouvez entièrement customiser les boites d'information]
#important[N'oubliez pas de mettre à jour le template]
```

#info[Information utile]
#hint[N'oubliez pas que vous pouvez entièrement customiser les boîtes d'information]
#important[N'oubliez pas de mettre à jour le template]

=== Boites personalisées

Pour créer vos propres boites, vous pouvez simplement modifier les fonctions existantes:

```typst
#let superimportant = important.with(
  accent_color: rgb("#8B0000"),
  title: "Super important !",
)

#superimportant[Attention, il faut impérativement penser à mettre à jour le template]
```

== Présentations

HEH-Template vous permet de réaliser des présentations composées de slides avec l'aide de #link("https://polylux.dev/book", "polylux"). Pour un exemple plus complet, référez vous à `demo_presentation.typ`.

=== Utilisation basique

Les présentations sont composées de groupes de slides. Ceux ci sont créés avec la fonction `slidegroup`. Par exemple:

```
#import "@preview/heh-template:1.0.0": heh_presentation_template, slidegroup, slide

#show: heh_presentation_template.with(
  ... // config
  handout_mode: false // Active le mode "handout" (supprime les animations)
)


#slidegroup("Introduction")[
  #slide[
    == Titre de la slide

    Bonjour !
  ]

  #slide[
    == Titre de l'autre slide

    Hello !
  ]
]
```

Vous pouvez aussi utiliser les `uncover`, `item-by-item`, ... et les autres helpers de polylux pour faire des animations (référez vous à la #link("https://polylux.dev/book", "documentation polylux"))

