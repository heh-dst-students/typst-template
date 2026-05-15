// Affiche les numéros de page à droite
#let page_numbers(
  show_total: true,
) = {
  align(
    right,
    counter(page).display(
      "1/1",
      both: show_total,
    ),
  )
}

