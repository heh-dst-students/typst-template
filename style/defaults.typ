#import "/style/images.typ": heh_images_defaults
#import "/style/text.typ": heh_headings_defaults, heh_links_defaults, heh_raw_defaults
#import "/style/tables.typ": heh_table_defaults

#let heh_style_defaults(
  document_config: (),
  print_config: (),
  campus_config: (),
  doc
) = {
  show: heh_headings_defaults.with(document_config, print_config, campus_config)
  show: heh_links_defaults.with(document_config, print_config, campus_config)
  show: heh_raw_defaults.with(print_config)

  show: heh_table_defaults.with(campus_config)
  doc
}
