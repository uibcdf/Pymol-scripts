# Carga de PDB

ModHor_E9034A.pdb

# Borrado de aguas

remove solvent

# Creación de selecciones con las que se trabajará

select protein, all

deselect

# Definición de colores

set_color color_helice, [162, 159, 21]
set_color color_hebra, [86, 22, 67]
set_color color_loop, [255, 212, 71]

color color_helice, ss h
color color_hebra, ss s
color color_loop, ss 1+''

# Elección del color de fondo

bg_color white

# Inicio de la representación

hide everything

show cartoon, protein
set cartoon_discrete_colors, 1
show surface, protein
set surface_color, white, protein
set transparency, 0.8
rebuild


