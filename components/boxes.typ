#import "/utils/utils.typ": single_color_svg
#import "/utils/states.typ": heh_config

#let box_default_styling = box.with(
  width: 100%,
  inset: 14pt,
)

#let grid_with_box_default_styling = grid.with(
  columns: (auto, 1fr),
  row-gutter: 14pt,
  column-gutter: 8pt,
  align: (alignment.center, alignment.horizon),
)

#let box_default(
  content,
  accent_color: rgb("#34356B"),
  title: "Default box",
  icon_path: "/assets/icons/information.vsvg",
  bg: auto,
) = context {
  let config = heh_config.get()
  let monochrome = config.print.monochrome

  let true_accent = if monochrome { black } else { accent_color }

  let bg = if monochrome {
    white
  } else {
    if bg == auto {
      accent_color.lighten(90%)
    } else {
      bg
    }
  }

  set text(fill: true_accent)

  box_default_styling(
    fill: bg,
    stroke: if monochrome { 1pt + black } else { none },
    grid_with_box_default_styling(
      single_color_svg(icon_path, true_accent),
      title,
      grid.cell(
        x: 0,
        y: 1,
        colspan: 2,
        align(left, rect(
          stroke: (left: 1pt + true_accent),
          inset: (left: 20pt),
          outset: (left: -6.5pt),
          content,
        )),
      ),
    ),
  )
}

#let info = box_default.with(
  icon_path: "/assets/icons/information.vsvg",
  title: "Information",
)

#let important = box_default.with(
  icon_path: "/assets/icons/important.vsvg",
  accent_color: rgb("#d02020"),
  title: "Important",
)

#let hint = box_default.with(
  icon_path: "/assets/icons/hint.vsvg",
  accent_color: rgb("#168a5c"),
  title: "Indice",
)

#let silly = box_default.with(
  icon_path: "/assets/icons/silly.vsvg",
  accent_color: rgb("#b31077"),
  title: "Info Silly",
)
