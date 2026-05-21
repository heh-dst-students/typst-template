#import "/utils/states.typ": heh_config

#let thanks_page() = context {
  let config = heh_config.get()
  box(
    width: 60%,
    text(style: "italic", {config.document.thanks})
  )
  pagebreak()
}