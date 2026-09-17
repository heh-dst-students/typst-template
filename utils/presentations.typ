#import "/utils/states.typ": (
  group_current_slide, group_slide_count, group_title_state, heh_config,
  slidegroups_count,
)
#import "/components/headers/headers.typ": presentation_header

#import "@preview/polylux:0.4.0": slide

#let slidegroup(title, content) = context {
  let configuration = heh_config.get()
  let subslides = content.children.filter(it => repr(it.func()) == "sequence")
  slidegroups_count.step()
  group_slide_count.update(subslides.len())
  group_title_state.update(title)
  group_current_slide.update(0)

  slide[
    #align(left + horizon, [
      #set page(header: context {
        presentation_header(show_progression: false, show_titles: false)
      })
      #set heading(numbering: "1.")
      #show heading: set text(
        size: 1.5em,
        weight: "bold",
        fill: black,
        top-edge: "cap-height"
      )

      = #title
    ])
  ]

  slide[]

  for subslide in subslides {
    group_current_slide.step()
    subslide
  }
}

