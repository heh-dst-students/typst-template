#let show_if_there_is_one_element(
  element: heading,
  to_show: outline,
) = context {
  if (counter(element).final().at(0) >= 1) {
    to_show()
  }
}
