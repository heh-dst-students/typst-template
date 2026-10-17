#import "/utils/utils.typ": format_author_names
#import "/utils/states.typ": heh_config

#let presentation_footer() = context {
  set text(size: 14pt)
  let config = heh_config.get()
  grid(
    columns: (auto, 3fr, 1fr),
    {
      format_author_names(config.document.authors, false).join(
        ", ",
        last: " et ",
      )
    },
    {
      align(center, {
        config.document.doc_title
      })
    },
    {
      // Affiche les numéros de page à droite
      align(
        right,
        counter(page).display(
          "1/1",
          both: true,
        ),
      )
    },
  )
}
