#import "/data/config.typ": default_print_config

#let heh_blank_page(
  print_config_fn: default_print_config,
) = {
  let print_config = print_config_fn()
  let show_blank_page = print_config.show_blank_page

  if (show_blank_page) {
    pagebreak()
  }
}
