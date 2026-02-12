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

#let auto_resize_vertical_bar(accent_color) = rect(
  width: 1pt,
  fill: accent_color,
  stroke: none,
)

#let box_default(
  content,
  accent_color: rgb("#34356B"),
  title: "Default box",
  icon_path: "/assets/icons/information.vsvg",
  ) = {
    set text(fill: accent_color)

    box_default_styling(
      fill: accent_color.lighten(90%),
    )[
      #grid_with_box_default_styling(
        [#top_left_icon(icon_path, accent_color)],
        [#title],
        [#auto_resize_vertical_bar(accent_color)],
        [#content]
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