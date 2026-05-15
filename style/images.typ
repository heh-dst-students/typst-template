#let heh_images_defaults(document_config, print_config, campus_config, doc) = {
  show image: it => {
    if (
      print_config.monochromeimages
        and print_config.monochrome
        and type(it.source) == str
    ) {
      import "@preview/grayness:0.5.0": plg
      let source = read(it.source, encoding: none)

      let graybytes = if it.source.ends-with("svg") {
        plg.svg_grayscale(source)
      } else {
        plg.grayscale(source)
      }

      image(
        graybytes,
        alt: it.alt,
        width: it.width,
        height: it.height,
        page: it.page,
        fit: it.fit,
        scaling: it.scaling,
        icc: it.icc,
      )
    } else {
      it
    }
  }

  doc
}
