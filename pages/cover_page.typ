#import "/utils/utils.typ": campus_branded_svg, heh_logo

#import "/data/config.typ": default_document_config, default_print_config
#import "/data/campus.typ"

#let heh_cover_page(
  document_config_fn: default_document_config,
  print_config_fn: default_print_config,
  campus_config_fn: campus.dst_config,
) = {
  let document_config = document_config_fn()
  let print_config = print_config_fn()
  let campus_config = campus_config_fn()

  set page(margin: (x: 45pt, y: 45pt))
  set text(font: ("Roboto", "Inter"))

  box(heh_logo(campus_config))
  h(1fr)
  [Année académique #text(document_config.year, fill: campus_config.style.primary_color)]

  line(length: 100pt, stroke: 3pt + campus_config.style.primary_color)

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
            campus_config,
          ),
          text(
            campus_config.contact.address_line1
              + linebreak()
              + campus_config.contact.address_line2,
          ),

          campus_branded_svg(
            "/assets/icons/phone.vsvg",
            campus_config,
          ),
          link(
            "tel:" + campus_config.contact.phone_nr_short,
            campus_config.contact.phone_nr_pretty,
          ),

          campus_branded_svg(
            "/assets/icons/mail.vsvg",
            campus_config,
          ),
          link(
            "mailto:" + campus_config.contact.mail,
            campus_config.contact.mail,
          ),
        )
        box(
          fill: campus_config.style.primary_color,
          inset: 5pt,
          text(
            "WWW.HEH.BE",
            weight: "bold",
            fill: campus_config.style.onprimary_color,
          ),
        )
      },
    )
  }

  v(1fr)

  align(right, box(
    fill: campus_config.style.primary_color,
    width: 75%,
    inset: (x: 20pt, y: 20pt),
    align(left)[
      #set text(size: 15pt, fill: campus_config.style.onprimary_color)

      #text(weight: "bold")[
        #document_config.doc_title
      ]

      #document_config.doc_description

      #document_config.formation_name \
      #document_config.orientation_name
    ],
  ))

  v(1fr)

  align(bottom, grid(
    columns: (1fr, auto, auto),
    gutter: 24pt,
    text(
      document_config
        .authors
        .map(it => (
          it.at(0) + linebreak() + link("mailto:" + it.at(1), it.at(1))
        ))
        .join(linebreak()),
    ),

    image(
      "/assets/logos/wbe.svg",
      alt: "Logo de WBE (Wallonie-Bruxelles Enseignement)",
      height: 5%,
    ),
    image("/assets/logos/ph.svg", alt: "Logo du Pôle Hainuyer", height: 5%),
  ))
}
