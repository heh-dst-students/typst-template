#import "lib.typ" : *

#show: heh_template.with(
  campus_config_fn: campus.dst_config,
  print_config_fn: config.default_print_config.with(monochrome: "monochrome" in sys.inputs and sys.inputs.monochrome == "true"),
  document_config_fn: config.default_document_config.with(
    doc_title: "Template HEH avec Typst",
    doc_description: "Template de document modulaire et universel au campus de la HEH.",
    formation_name: none,
  )
)

= Hello there
#lorem(24)


== Level 2
#lorem(24)

=== Level 3
#lorem(24)

#info[this is some content]
#hint[C'est un indice]
#important[C'est une info importante]
#silly[Petite information silly]

#pagebreak()

= Les Tableaux
Dans le heh-template, nous avons fait des tableaux en thème avec les couleurs des différents campus de la heh. le style est appliqué par défault si vous faite un simple tableau `#table()`.

Par exemple:
```typst
#table(
  columns: (50pt, 1fr, 1fr),
  table.header(
    [ID], [Nom], [Email]
  ),
  [1], [John Doe], [john.doe\@std.heh.be],
  [2], [John Doe], [john.doe\@std.heh.be],
  [3], [John Doe], [john.doe\@std.heh.be],
)
```
#table(
  columns: (50pt, 1fr, 1fr),
  table.header(
    [ID], [Nom], [Email]
  ),
  [1], [John Doe], [john.doe\@std.heh.be],
  [2], [John Doe], [john.doe\@std.heh.be],
  [3], [John Doe], [john.doe\@std.heh.be],
)

== Tableaux double entrées
Si vous voulez faire des tableaux a double entrées, vous pouvez importer directement `#double_table()` depuis heh-template

exemple:
```typst
#double_table(
  columns: (50pt, 1fr, 1fr),
  [], [A], [not A],
  [B], [O], [X],
  [not B], [X], [X]
)
```

#double_table(
  columns: (50pt, 1fr, 1fr),
  [], [A], [not A],
  [B], [O], [X],
  [not B], [X], [X]
)