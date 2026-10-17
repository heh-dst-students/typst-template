#import "/utils/utils.typ": campus_branded_svg, heh_logo
#import "/utils/states.typ": heh_config

#let presentation_cover_page() = context {
  let config = heh_config.get()
  set page(margin: (x: 30pt, y: 30pt), header: none, footer: none)
  set text(font: ("Roboto", "Inter"), size: 12pt)
  show link: set text(fill: black)

  box(heh_logo(width: 200pt))
  h(1fr)
  [Année académique #text(config.document.year, fill: config.campus.style.primary_color)]

  line(length: 100pt, stroke: 3pt + config.campus.style.primary_color)

  {
    set text(size: 8pt)
    box(
      width: 40%,
      {
        grid(
          columns: (13pt, 1fr),
          align: horizon,
          row-gutter: 5pt,
          column-gutter: 5pt,

          campus_branded_svg(
            "/assets/icons/address.vsvg",
          ),
          text(
            config.campus.contact.address_line1
              + linebreak()
              + config.campus.contact.address_line2,
          ),

          campus_branded_svg(
            "/assets/icons/phone.vsvg",
          ),
          link(
            "tel:" + config.campus.contact.phone_nr_short,
            config.campus.contact.phone_nr_pretty,
          ),

          campus_branded_svg(
            "/assets/icons/mail.vsvg",
          ),
          link(
            "mailto:" + config.campus.contact.mail,
            config.campus.contact.mail,
          ),
        )
        box(
          fill: config.campus.style.primary_color,
          inset: 5pt,
          text(
            "WWW.HEH.BE",
            weight: "bold",
            fill: config.campus.style.onprimary_color,
          ),
        )
      },
    )
  }

  v(1fr)

  grid(
    columns: (auto, 1fr),
    text(
      config
        .document
        .authors
        .map(it => (
          it.at(0) + linebreak() + link("mailto:" + it.at(1), it.at(1))
        ))
        .join(linebreak()),
    ),
    align(right, box(
      fill: config.campus.style.primary_color,
      width: 90%,
      inset: (x: 20pt, y: 20pt),
      align(left)[
        #set text(size: 15pt, fill: config.campus.style.onprimary_color)

        #text(weight: "bold")[
          #config.document.doc_title
        ]

        #config.document.doc_description

        #config.document.formation_name \
        #config.document.orientation_name
      ],
    )),
  )

  v(1fr)

  align(bottom + right, grid(
    columns: (auto, auto),
    gutter: 24pt,

    image(
      "/assets/logos/wbe.svg",
      alt: "Logo de WBE (Wallonie-Bruxelles Enseignement)",
      height: 5%,
    ),
    image("/assets/logos/ph.svg", alt: "Logo du Pôle Hainuyer", height: 5%),
  ))
}
