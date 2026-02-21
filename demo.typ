#import "lib.typ" : heh_template, config, campus, info, silly, important, hint

#show: heh_template.with(
  campus_config_fn: campus.dst_config,
  print_config_fn: config.default_print_config.with(monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"),
  document_config_fn: config.default_document_config.with(
    doc_title: "Template HEH avec Typst",
    doc_description: "Template de document modulaire et universel au campus de la HEH.",
    formation_name: none,
  )
)

= Hello there
#lorem(24)


== Level 2
#lorem(24)

=== Level 3
#lorem(24)

#info[this is some content]
#hint[C'est un indice]
#important[C'est une info importante]
#silly[Petite information silly]