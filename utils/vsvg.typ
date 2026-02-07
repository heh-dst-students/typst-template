#let vsvg(
  source: "image.vsvg",
  params: ((key: "variable", value: "value")),
  ..args) = {
  let imageString = read(source)

  for param in params {
    imageString = imageString.replace(
      regex("\{"+param.key+"\}"),
      param.value
    )
  }

  image(bytes(imageString), ..args)
}

#let vsvg_heh(
  source: "image.vsvg",
  campus_config,
  ..args
) = {
  vsvg(
    source: source,
    params: (
      (key: "color",  value: campus_config.primary_color.to-hex()),
      (key: "title", value: campus_config.title),
      (key: "subtitle", value: campus_config.subtitle)
    ), ..args)
}