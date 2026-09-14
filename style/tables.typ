#import "/utils/states.typ": heh_config

#let heh_table_defaults(
  doc,
) = context {
  let config = heh_config.get()
  show table: it => box(radius: 5pt, clip: true, it)

  set table(
    stroke: none,
    inset: 0.6em,
    gutter: 2pt,
    fill: (x, y) => {
      if (y == 0) {
        config.campus.style.primary_color.darken(40%)
      } else {
        config.campus.style.primary_color.transparentize(90%)
      }
    },
  )

  show table.cell: it => {
    if (it.y == 0) {
      set text(white, weight: "bold")
      it
    } else {
      it
    }
  }

  doc
}
