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
  campus_config,
  ..args,
) = template_svg(
  source,
  params: (
    (key: "color", value: campus_config.style.primary_color.to-hex()),
    (key: "title", value: campus_config.naming.logo_title),
    (key: "subtitle", value: campus_config.naming.logo_subtitle),
  ),
  ..args,
)

#let heh_logo(..args) = campus_branded_svg("/assets/logos/heh-logo.vsvg", ..args)

