#import "lib.typ" : heh_template

#show: heh_template.with(
  campus: "DST",
  monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"
)

