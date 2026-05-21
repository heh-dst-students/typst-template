#import "/utils/utils.typ": heh_logo;
#import "/components/headers/headers.typ": logo_year_title;
#import "/utils/states.typ": heh_config

#let tfe_cover_page(
  show_year: false
) = context {
  set page(margin: (x: 45pt, y: 45pt), header: none, footer: none)
  set text(font: ("Roboto", "Inter"), size: 14pt)
  show link: set text(fill: black)
  let config = heh_config.get()
  logo_year_title(show_title: false)
  
  v(.4fr)

  align(
    center,
    text(
      size: 14pt,
      top-edge: 1.25em,
      spacing: 100% + 2pt
    )[
      HAUTE ÉCOLE DE LA COMMUNAUTÉ FRANÇAISE EN HAINAUT \
      #config.campus.naming.full_name \
      #config.campus.contact.address_line1 - #config.campus.contact.address_line2
    ]
  )

  v(1fr)

  align(
    center,
    text(size: 16pt, weight: "bold")[
      #config.document.doc_title
    ]
  )

  v(.3fr)

  align(
    center,
    text(size: 12pt)[
      #config.document.doc_description
    ]
  )

  v(1fr)

  let columns_amount = 2
  if (show_year) {
    columns_amount = 3
  }

  columns(columns_amount)[
    Promoteur.trice interne : #config.document.internal_promoter
    #colbreak()
    #if (show_year) {
      align(center, config.document.exam_session)
      colbreak()
    }
    #align(right, {
      grid(
        columns: (auto, auto),
        gutter: .5em,
        [Rédigé par : ],
        {
          align(left, {
            for author in config.document.authors {
              author.at(0)
              linebreak()
            }
          })
        },
      )
    })
  ]

  pagebreak()
}

#tfe_cover_page()
