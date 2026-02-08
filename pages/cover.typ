#import "../utils/vsvg.typ": vsvg_heh

#let heh_cover_page(
  campus_config: (),
  document_title: "Titre",
  document_description: "Description",
  formation_name: "Bachelier en Informatique",
  orientation_name: "Orientation Développement",
  authors_names_mails: (
    ("Prenom Nom", "prenom.nom@std.heh.be"),
    ("Xy Z", "xy.z@std.heh.be"),
  ),
  year: "2025 - 2026"
) = [
  #set page(margin: (left: 5%, top: 5%, right: 5%, bottom: 5%))
  #set text(font: "Inter")

  #box(
    vsvg_heh(
      source: "../assets/logos/heh-logo.vsvg", campus_config, width: 40%)
  )
  #h(1fr)
  Année académique #text(year, fill: campus_config.primary_color)
  
  #line(length: 20%, stroke: 3pt + campus_config.primary_color)
  #[
    #set text(size: 8pt)
    #box(width: 40%,
      grid(
        columns: (6%, 1fr),
        align: horizon,
        row-gutter: 5pt,

        vsvg_heh(
          source: "../assets/icons/address.vsvg", campus_config), text(campus_config.address_line1 + linebreak() + campus_config.address_line2),
        vsvg_heh(
          source: "../assets/icons/phone.vsvg", campus_config), link("tel:" + campus_config.phone_nr_short, campus_config.phone_nr_pretty),
        vsvg_heh(source: "../assets/icons/mail.vsvg", campus_config), link("mailto:" + campus_config.mail, campus_config.mail),
      ) +
      box(
        fill: campus_config.primary_color,
        inset: 5pt,
        text("WWW.HEH.BE", weight: "bold", fill: campus_config.onprimary_color)
      )
    )
  ]

  #v(1fr)

  #align(right)[
    #box(
      fill: campus_config.primary_color,
      height: 20%,
      width: 75%,
      inset: (left: 5%, top: 10%)
    )[
        #align(left)[
        #set text(size: 15pt, fill: campus_config.onprimary_color)

        #document_title
    
        #document_description

        #formation_name

        #orientation_name
      ]
    ]
  ]
  
  #v(1fr)

  #align(bottom)[
    #grid(columns: (1fr, auto, auto),
      gutter: 24pt,
      text(authors_names_mails
        .map(it => it.at(0) + linebreak() + link("mailto:" + it.at(1), it.at(1)))
        .join(linebreak())),
      
      image("/assets/logos/wbe.svg", alt: "Logo de WBE (Wallonie-Bruxelles Enseignement)", height: 5%),
      image("/assets/logos/ph.svg", alt: "Logo de WBE (Wallonie-Bruxelles Enseignement)", height: 5%)
    )
  ]
]
