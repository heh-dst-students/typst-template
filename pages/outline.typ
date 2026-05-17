#import "/data/config.typ": default_print_config
#import "/utils/utils.typ": show_if_has_match

#let heh_outline_page(
  print_config_fn: default_print_config,
) = {
  let print_config = print_config_fn()
  let outlines = print_config.outlines

  if (outlines != none and outlines != ()) {
    for o in outlines {
      show_if_has_match(
        selector: o.target,
        to_show: outline.with(title: o.title, target: o.target),
      )
    }
    pagebreak()
  }
}
