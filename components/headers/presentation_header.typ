#import "/utils/utils.typ": get_next_heading, heh_logo
#import "/utils/states.typ": (
  group_current_slide, group_slide_count, group_title_state, heh_config,
)
#import "@preview/polylux:0.4.0": toolbox

// Affiche le logo à gauche et l'année académique et le titre à droite
#let presentation_header(show_titles: true, show_progression: true) = context {
  let next_heading = get_next_heading(level: 2)
  let config = heh_config.get()
  set text(size: 14pt)

  grid(
    columns: (100pt, 1fr, auto),
    heh_logo(width: 200pt),
    {
      if show_titles {
        colbreak()
        align(center + horizon)[
          #set text(size: 16pt)
          #underline(group_title_state.get())
          #linebreak()
          #next_heading
        ]
      }
    },
    context {
      if show_progression {
        colbreak()

        align(right + horizon, {
          // La slide actuelle n'est pas passée
          let max_dots = 13

          let passed_slides = group_current_slide.get().at(0) - 1
          let remaining_slides = (
            group_slide_count.get().at(0) - passed_slides - 1
          )

          let total_slides = passed_slides + remaining_slides + 1

          if total_slides > max_dots {
            if passed_slides > 1 {
              passed_slides = calc.max(
                1,
                passed_slides - (total_slides - max_dots),
              )
            }
            total_slides = passed_slides + remaining_slides + 1
            if total_slides > max_dots {
              remaining_slides = calc.max(
                0,
                remaining_slides - (total_slides - max_dots),
              )
            }
          }

          let slidecircle(fill: none) = box(inset: 3pt, circle(
            radius: 4pt,
            fill: fill,
          ))

          for _ in range(passed_slides) {
            slidecircle(
              fill: config.campus.style.primary_color.transparentize(60%),
            )
          }

          slidecircle(fill: config.campus.style.primary_color)

          for _ in range(remaining_slides) {
            slidecircle()
          }
        })
      }
    },
  )
}

