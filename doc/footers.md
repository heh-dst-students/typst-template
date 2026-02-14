# Footers

## Liste des footers

- [Numéros de page](#numéros-de-page)
- [Numéros de page avec indicateur de coté](#numéros-de-page-avec-indicateur-de-coté)

## Numéros de page

Affiche les numéros de page à droite de la page

```typst
...
footer_style: footers.page_numbers
...
```

### Paramètres

- `show_total`: Affiche le nombre total de pages du document à coté (par défaut)

## Numéros de page avec indicateur de coté

Affiche les numéros de page à gauche ou à droite de la page, selon la ou elle devrait être imprimée (page de gauche => gauche, page de droite => droite)

```typst
...
footer_style: footers.page_numbers_side
...
```

### Paramètres

- `show_total`: Affiche le nombre total de pages du document à coté (par défaut)
