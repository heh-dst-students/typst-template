#let heh_table_defaults(
  campus_config,
  doc,
) = {
  show table: it => box(radius: 5pt, clip: true, it)

  set table(
    stroke: none,
    inset: 8pt,
    gutter: 2pt,
    fill: (x, y) => {
      if (y == 0) {
        campus_config.style.primary_color.darken(40%)
      } else {
        campus_config.style.primary_color.transparentize(90%)
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
