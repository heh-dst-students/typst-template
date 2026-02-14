#import "lib.typ" : heh_template, config, campus, info, silly, important, hint

#show: heh_template.with(
  campus_config_fn: campus.deco_config,
  print_config_fn: config.default_print_config.with(monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"),
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