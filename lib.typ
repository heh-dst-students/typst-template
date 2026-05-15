#import "pages/cover_page.typ": heh_cover_page
#import "pages/outline.typ": heh_outline_page
#import "pages/blank_page.typ": heh_blank_page
#import "data/config.typ"
#import "data/campus.typ"
#import "/utils/states.typ": campus_config_context
#import "components/box/boxes.typ": hint, important, info, monochrome, silly
#import "components/tables/double_table.typ": double_table

#import "/components/headers/headers.typ"
#import "/components/footers/footers.typ"

#import "/style/defaults.typ" as style_defaults

#let heh_template(
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

  monochrome.update(print_config.monochrome)

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
  campus_config_context.update(campus_config)
  set page("a4")
  set heading(numbering: "1.")
  set text(font: (print_config.font, "Open Sans"), lang: print_config.lang)

  set document(title: document_config.doc_description)

  show: style_defaults.heh_images_defaults.with(document_config, print_config, campus_config)

  heh_cover_page(
    document_config_fn: document_config_fn,
    print_config_fn: print_config_fn,
    campus_config_fn: campus_config_fn,
  )

  show: style_defaults.heh_style_defaults.with(document_config: document_config, print_config: print_config, campus_config: campus_config)

  pagebreak()
  set page(
    header: context header_style(
      document_config: document_config,
      print_config: print_config,
      campus_config: campus_config,
    ),
    margin: (top: 125pt),
  )

  heh_outline_page(print_config_fn: print_config_fn)

  heh_blank_page(print_config_fn: print_config_fn)

  set page(
    footer: context footer_style(
      document_config: document_config,
      print_config: print_config,
      campus_config: campus_config,
    ),
  )

  counter(page).update(1)

  doc
}
