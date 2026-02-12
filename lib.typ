#import "pages/cover.typ" : heh_cover_page
#import "data/config.typ"
#import "data/campus.typ"
#import "utils/vsvg.typ" : vsvg_heh
#import "box/boxes.typ": info, important, hint, silly

#import "headers/headers.typ"
#import "footers/footers.typ"

#let heh_template(
  document_config_fn: config.default_document_config,
  print_config_fn: config.default_print_config,
  
  campus_config_fn: campus.dst_config,

  header_style: headers.logo_title,
  header_extra_params: (),
  footer_style: footers.page_numbers,
  footer_extra_params: (),

  doc
) = {
  let document_config = document_config_fn()
  let print_config = print_config_fn()

  if print_config.monochrome {
    campus_config_fn = campus_config_fn.with(
      style: campus.default_style_config.with(
        primary_color: black,
        onprimary_color: white,
        decorations_color: black
      )
    )
  }

  let campus_config = campus_config_fn()
  
  set page("a4")
  set heading(numbering: "1.")
  set text(font: (print_config.font, "Open Sans"), lang: print_config.lang)

  set document(title: document_config.doc_description)

  show image: it => {
    if print_config.monochromeimages and print_config.monochrome and type(it.source) == str {
      import "@preview/grayness:0.5.0" : plg
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
        icc: it.icc
      )
    } else {
      it
    }
  }

  heh_cover_page(
    document_config_fn: document_config_fn,
    print_config_fn: print_config_fn,
    campus_config_fn: campus_config_fn
  )

  pagebreak()
  
  let decorations_color = campus_config.style.decorations_color

  show heading: set text(weight: "medium") if not print_config.monochrome
  show heading.where(level: 1): set text(fill: decorations_color) if not print_config.monochrome
  show heading.where(level: 2): set text(fill: decorations_color.lighten(5%)) if not print_config.monochrome
  show heading.where(level: 3): set text(fill: decorations_color.lighten(10%)) if not print_config.monochrome

  show link: set text(fill: decorations_color.lighten(15%)) if not print_config.monochrome
  show link: it => if print_config.monochrome { underline(it) } else { it }

  set page(
    header: context header_style(
      document_config: document_config,
      print_config: print_config,
      campus_config: campus_config,
      ..header_extra_params
    ),
    margin: (top: 125pt),
    footer: context footer_style(
      document_config: document_config,
      print_config: print_config,
      campus_config: campus_config,
      ..footer_extra_params
    )
  )
  
  counter(page).update(1)

  if print_config.show_outline {
    outline(title: "Table des matières")
    pagebreak()
  }

  doc
}
