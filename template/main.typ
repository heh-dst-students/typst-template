#import "@local/heh-template:1.0.0": *

#show: heh_document_template.with(
  document_config_fn: config.default_document_config.with(
    doc_title: "Titre du document",
    doc_description: "Description du document",
    formation_name: none,
    orientation_name: none,
    authors: (
      ("Auteur", ""),
    ),
  ),
  print_config_fn: config.default_print_config.with(
    monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true",
  ),
)

