// Contient la configuration du document
#let heh_config = state(
  "heh_config",
  (
    document: (),
    print: (),
    campus: (),
  ),
)


#let slidegroups_count = counter("slidegroups")
#let group_slide_count = counter("group_slide_count")
#let group_title_state = state("group_title", "")
#let group_current_slide = counter("group_current_slide")

