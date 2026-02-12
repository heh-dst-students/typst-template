# Modifier les configurations d'un campus

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

## Exemple: modification des noms

```typst
...
campus_config_fn: campus.dst_config.with(
    naming: campus.dst_naming_config().with(
        full_name: "Département des technologies et sciences"
    )
)
...
```

> **N.B**: Vous devez appelle les fonctions `_(naming|style|contact)_config` car elles retounent elles mêmes des versions modifiées de `default_..._config`

