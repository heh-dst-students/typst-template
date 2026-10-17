#import "/pages/cover_page.typ": heh_cover_page
#import "/pages/presentation_cover_page.typ": presentation_cover_page
#import "/pages/tfe_cover_page.typ": tfe_cover_page
#import "/pages/outline.typ": heh_outline_page
#import "/pages/blank_page.typ": heh_blank_page
#import "/pages/thanks.typ": thanks_page

#import "/data/config.typ"
#import "/data/campus.typ"

#import "/utils/states.typ": heh_config
#import "/utils/presentations.typ": slidegroup

#import "/components/headers/headers.typ"
#import "/components/footers/footers.typ"
#import "/components/boxes.typ": hint, important, info, silly
#import "/components/double_table.typ": double_table

#import "/style/defaults.typ" as style_defaults

#import "@preview/polylux:0.4.0": enable-handout-mode, slide

#let heh_common_template(doc) = context {
  let config = heh_config.get()

  set text(font: (config.print.font, "Open Sans"), lang: config.print.lang)
  set document(title: config.document.doc_description)
  show: style_defaults.heh_images_defaults
  show: style_defaults.heh_style_defaults

  doc
}

#let heh_document(
  document_config_fn: config.default_document_config,
  print_config_fn: config.default_print_config,
  campus_config_fn: campus.dst_config,

  header_style: headers.logo_year_title,
  footer_style: footers.page_numbers,

  doc,
) = context {
  let document_config = document_config_fn()
  let print_config = print_config_fn()
  let campus_config_fn = campus_config_fn

  if print_config.monochrome {
    campus_config_fn = campus_config_fn.with(
      style: campus.default_style_config.with(
        primary_color: black,
        onprimary_color: white,
        decorations_color: black,
      ),
    )
  }

  let campus_config = campus_config_fn()

  let conf = (
    document: document_config,
    print: print_config,
    campus: campus_config,
  )
  heh_config.update(conf)

  show: heh_common_template

  set page("a4")
  set heading(numbering: "1.")

  heh_cover_page()
  pagebreak()

  set page(
    header: context header_style(),
    margin: (top: 125pt),
  )

  heh_outline_page()
  heh_blank_page()

  set page(footer: context footer_style())

  counter(page).update(1)
  doc
}

#let heh_presentation(
  document_config_fn: config.default_document_config,
  print_config_fn: config.default_print_config,
  campus_config_fn: campus.dst_config,

  handout_mode: false,
  doc,
) = context {
  let document_config = document_config_fn()
  let print_config = print_config_fn()
  let campus_config_fn = campus_config_fn

  if print_config.monochrome {
    campus_config_fn = campus_config_fn.with(
      style: campus.default_style_config.with(
        primary_color: black,
        onprimary_color: white,
        decorations_color: black,
      ),
    )
  }

  let campus_config = campus_config_fn()

  let conf = (
    document: document_config,
    print: print_config,
    campus: campus_config,
  )
  heh_config.update(conf)
  enable-handout-mode(handout_mode)

  set text(size: 20pt)
  show: heh_common_template
  set page(
    "presentation-16-9",

    header: context { headers.presentation_header() },
    footer: context { footers.presentation_footer() },
    margin: (top: 100pt, x: 30pt),
  )

  slide[#presentation_cover_page()]

  show heading.where(level: 2): none

  doc
}

#let heh_tfe(
  document_config_fn: config.default_document_config,
  print_config_fn: config.default_print_config,

  campus_config_fn: campus.dst_config,

  header_style: headers.logo_year_title,
  footer_style: footers.page_numbers,

  doc,
) = {
  let document_config = document_config_fn()
  let print_config = print_config_fn()
  let campus_config_fn = campus_config_fn

  if print_config.monochrome {
    campus_config_fn = campus_config_fn.with(
      style: campus.default_style_config.with(
        primary_color: black,
        onprimary_color: white,
        decorations_color: black,
      ),
    )
  }

  let campus_config = campus_config_fn()

  let conf = (
    document: document_config,
    print: print_config,
    campus: campus_config,
  )
  heh_config.update(conf)

  show: heh_common_template
  set page("a4")
  set heading(numbering: "1.")

  show: style_defaults.heh_images_defaults.with()
  show: style_defaults.heh_style_defaults.with()

  tfe_cover_page()
  pagebreak()
  tfe_cover_page(show_year: true)

  thanks_page()

  set page(
    header: context header_style(),
    margin: (top: 125pt),
  )

  heh_outline_page()

  heh_blank_page()

  set page(
    footer: context footer_style(),
  )

  counter(page).update(1)

  doc
}
