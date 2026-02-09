// Affiche les numéros de page à droite
#let page_numbers(
  document_config: (),
  print_config: (),
  campus_config: (),
  ..args
) = {
  align(right)[
    #counter(page).display(
      "1/1",
      both: true
    )
  ]
}

