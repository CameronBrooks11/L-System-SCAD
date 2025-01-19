# Docs

Welcome to da docs!

```mermaid
graph TD
  L_system2 --> create_lookup
  L_system2 --> apply_rules
  L_system2 --> segmented_lines

  create_lookup --> substr
  create_lookup --> in_list
  create_lookup --> join

  apply_rules --> join

  segmented_lines --> line
  segmented_lines --> circle["OpenSCAD 'circle'"]

  join --> _jb

  _jb --> substr
  sublist --> join

  line --> square["OpenSCAD 'square'"]
  line --> circle["OpenSCAD 'circle'"]

  create_lookup --> sublist

```
