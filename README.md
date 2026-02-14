# HEH Typst Github template

Template [typst](https://typst.app) pour les documents HEH de tout les départements

Ce template contient:
- La page de garde HEH
- Des styles pour les titres, liens, en-têtes de pages, pieds de pages, ...
- Des boites d'information, d'avertissement, ...

## Utilisation basique

Pour utiliser le template, commencez par le télécharger dans le dossier de vos paquets locaux typst. Ici par exemple, sous `heh-template/1.0.0`. Pour respecter la charte graphique HEH, la **police utilisée est Roboto**.

Afin que le style sout appliqué en entier, utilisez une directive `show` globale au document:

```typst
#import "@local/heh-template:1.0.0" : heh_template, campus, config

// Appel du template en utilisant le style du département technique (DST)
#show: heh_template.with(
  campus_config_fn: campus.dst_config,
  document_config_fn: config.default_document_config
)

= Premier titre
```

### Départements disponibles

Comme paramètre pour `campus_config_fn`, vous pouvez choisir parmis les différents départements de la HEH:

- `dst_config` : Département des sciences et technologies
- `dss_ms_config` : Département des sciences sociales (Mons)
- `dss_to_config` : Département des sciences sociales (Tournai)
- `dsee_ms_config` : Département des sciences de l'éducation et de l'enseignement (Mons)
- `dsee_to_config` : Département des sciences de l'éducation et de l'enseignement (Tournai)
- `deco_config` : Département des sciences juridiques, économiques et de gestion

## Configuration du document

Pour modifier la configuration du document, vous devez modifier la fonction `default_document_config` avec `.with()` pour changer ses paramètres par défaut. Par exemple:

```typst
#import "@local/heh-template:1.0.0" : heh_template, campus, config

// Appel du template en utilisant le style du département technique (DST)
#show: heh_template.with(
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

## Configuration de l'impression / des pages

Les données de configuration des pages / du document se trouvent dans `print_config_fn` qui peut être modifiée de la même façon que `document_config_fn`. Par exemple:

```typst
...
#show: heh_template.with(
    ...
    print_config_fn: default_print_config.with(
      monochrome: false // Si `true`, le document sera affiché uniquement en nuances de gris,
      monochromeimages: true // Si `true` et que le mode monochrome est activé, transforme automatiquement toutes les images du document en nuances de gris,

      show_outline: true // Affiche ou non la table des matières,
      font: "Roboto" // Police d'écriture du document,
      lang: "fr" // Langage du document
    )
)
...
```

Pour définir le paramètre `monochrome` plus simplement, vous pouvez utilise `sys.inputs` et compiler le fichier avec `--input monochrome=true`

```typst
...
monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"
...
```

## Configuration des pieds de page et en-têtes

Les pieds et en-têtes de page n'étant pas standards pour toute la HEH, le template propose plusieurs style et vous permet de définir les vôtres facilement en modifiant les paramètres `header_style` et `footer_style` de `heh_template`. Vous pouvez également y rajouter des paramètres supplémentaires en utilisant la fonction `.with()` sur la fonction du header / footer

Vous pouvez consulter la documentation des headers dans [doc/headers.md](doc/headers.md) et des footers dans [doc/footers.md](doc/footers.md)

### Exemple de changement de footers

```typst
#import "@local/heh-template:1.0.0" : headers, footers, ...
...
#show: heh_template.with(
    ...
    header_style: headers.year_title, // Affiche l'année académique et le titre
    header_extra_params: (),
    footer_style: footer.page_numbers.with(
      show_total: false
    ), // Affiche les numéros de pages (sans le total)
)
...

```

### Définition d'une fonction personalisée (headers / footers)

```typst
...
#let myheader(
  document_config: (), // Fourni par défaut par heh_template
  print_config: (), // Fourni par défaut par heh_template
  campus_config: (), // Fourni par défaut par heh_template
  show_logo: false
) = {}

#show: heh_template.with(
    ...
    header_style: myheader.with(show_logo: true),
)
```

## Modifications avancées

Pour savoir comment modifier les configurations d'un campus, lisez [doc/modif-campus.md](doc/modif-campus.md)

