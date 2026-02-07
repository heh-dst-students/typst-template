#import "lib.typ" : heh_template

#show: heh_template.with(
  campus: "DST",
  monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"
)

= Hello there

== Level 2

=== Level 3

Je suis le texte HEH #link("https://heh.be", "heh.be")

