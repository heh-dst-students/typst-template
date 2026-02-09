#import "lib.typ" : heh_template, config, campus

#show: heh_template.with(
  campus_config_fn: campus.deco_config.with(
    naming: campus.deco_naming_config().with(
      logo_title: "Scientifique !"
    )
  ),
  print_config_fn: config.default_print_config.with(monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true")
)

= Hello there

== Level 2

=== Level 3

Je suis le texte HEH #link("https://heh.be", "heh.be")

