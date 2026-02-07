#import "lib.typ" : heh_template

#show: heh_template.with(
  monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"
)

