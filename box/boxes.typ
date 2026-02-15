#import "/utils/vsvg.typ": vsvg_with_one_accent_color

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

#let top_left_icon(
  icon_path, accent_color
) = {
  vsvg_with_one_accent_color(
    source: icon_path,
    accent_color: accent_color
  )
}

#let monochrome = state("monochrome", false)

#let box_default(
  content,
  accent_color: rgb("#34356B"),
  title: "Default box",
  icon_path: "/assets/icons/information.vsvg",
  bg: auto
  ) = context {
    let true_accent = if monochrome.get() { black } else { accent_color }
    let bg = if monochrome.get() {
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
      stroke: if monochrome.get() { 1pt + black } else { none }
    )[
      #grid_with_box_default_styling(
        [#top_left_icon(icon_path, true_accent)],
        [#title],
        grid.cell(
          x: 0, y: 1, colspan: 2
          )[
            #align(left)[
              #rect(
                stroke: (left: 1pt + true_accent),
                inset: (left: 20pt),
                outset: (left: -8pt)
              )[#content]
            ]
          ]
      )
    ]
}

#let info = box_default.with(
  icon_path: "/assets/icons/information.vsvg",
  title: "Information"
)

#let important = box_default.with(
  icon_path: "/assets/icons/important.vsvg",
  accent_color: rgb("#d02020"),
  title: "Important"
)

#let hint = box_default.with(
  icon_path: "/assets/icons/hint.vsvg",
  accent_color: rgb("#168a5c"),
  title: "Indice"
)

#let silly = box_default.with(
  icon_path: "/assets/icons/silly.vsvg",
  accent_color: rgb("#b31077"),
  title: "Info Silly"
)
