#import "/utils/states.typ": heh_config

#let double_table(
  ..args,
) = context {
  let primary_color = heh_config.get().campus.style.primary_color
  show table.cell: it => {
    if (it.y == 0 or it.x == 0) {
      set text(white, weight: "bold")
      it
    } else {
      it
    }
  }

  table(
    ..args, fill: (x, y) => {
      if (y == 0 or x == 0) {
        primary_color.darken(40%)
      } else {
        primary_color.transparentize(90%)
      }
    }
  )
}
