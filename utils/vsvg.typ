#let vsvg(
  source: "image.vsvg",
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

#let vsvg_heh(
  source: "image.vsvg",
  campus_config: (),
  ..args,
) = vsvg(
  source: source,
  params: (
    (key: "color", value: campus_config.style.primary_color.to-hex()),
    (key: "title", value: campus_config.naming.logo_title),
    (key: "subtitle", value: campus_config.naming.logo_subtitle),
  ),
  ..args,
)


#let vsvg_with_one_accent_color(
  source: "image.vsvg",
  accent_color: rgb("#FFFFFF"),
  ..args,
) = vsvg(
  source: source,
  params: ((key: "color", value: accent_color.to-hex()),),
  ..args,
)
