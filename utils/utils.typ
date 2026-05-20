#import "/utils/states.typ": heh_config

#let get_next_heading(level: 1) = context {
  let headings = query(heading.where(level: level).after(here()))
  if headings.len() > 0 {
    let h = headings.first()
    if h.location().page() == here().page() {
      h.body
    } else {
      none
    }
  } else {
    none
  }
}

#let show_if_has_match(
  selector: heading,
  to_show: outline,
) = context {
  if (counter(selector).final().at(0) >= 1) {
    to_show()
  }
}

#let template_svg(
  source,
  params: (key: "variable", value: "value"),
  ..args,
) = {
  let imageString = read(source)

  for param in params {
    imageString = imageString.replace(
      regex("\{" + param.key + "\}"),
      param.value,
    )
  }

  image(bytes(imageString), ..args)
}

#let single_color_svg(
  source,
  color,
  ..args,
) = template_svg(
  source,
  params: ((key: "color", value: color.to-hex()),),
  ..args,
)

#let campus_branded_svg(
  source,
  ..args,
) = context {
  let config = heh_config.get()
  template_svg(
    source,
    params: (
      (key: "color", value: config.campus.style.primary_color.to-hex()),
      (key: "title", value: config.campus.naming.logo_title),
      (key: "subtitle", value: config.campus.naming.logo_subtitle),
    ),
    ..args,
  )
}

#let heh_logo(..args) = campus_branded_svg(
  "/assets/logos/heh-logo.vsvg",
  ..args,
)

