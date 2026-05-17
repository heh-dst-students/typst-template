#import "/style/images.typ": heh_images_defaults
#import "/style/text.typ": (
  heh_headings_defaults, heh_links_defaults, heh_raw_defaults,
)
#import "/style/tables.typ": heh_table_defaults

#let heh_style_defaults(
  doc,
) = {
  show: heh_headings_defaults
  show: heh_links_defaults
  show: heh_raw_defaults

  show: heh_table_defaults
  doc
}
