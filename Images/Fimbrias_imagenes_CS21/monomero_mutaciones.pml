# Cargo pdb

load WT_E9034A.pdb


# Borro aguas

remove solvent


# Creo selecciones con las que trabajar

select protein, all
select mut_1, residue 18
select mut_2, residue 28
select mut_3, residue 49
select mut_4, residue 87
select mut_5, residue 131
select mut_6, residue 143
select mut_7, residue 160
select mut_8, residue 161
select mut_9, residue 169

deselect

# Creo colores

set_color color_helice, [162, 159, 21]
set_color color_hebra, [86, 22, 67]
set_color color_loop, [255, 212, 71]
set_color color_mutation, [236, 78, 32]

color color_helice, ss h
color color_hebra, ss s
color color_loop, ss l+''

# Color de fondo

bg_color white


# Empezamos la representación

hide everything

set transparency_mode, 1

show cartoon, protein
set cartoon_discrete_colors, 1
set cartoon_transparency, 0.5
rebuild

show surface, protein
set surface_color, white, protein
set transparency, 0.8

show sticks, mut_1
show sticks, mut_2
show sticks, mut_3
show sticks, mut_4
show sticks, mut_5
show sticks, mut_6
show sticks, mut_7
show sticks, mut_8
show sticks, mut_9
set stick_color, color_mutation

rebuild

## Quita la neblina
set depth_cue, 0

## Quito o pongo perspectiva
set orthoscopic, on

# Fijo posición
#>>> Esta es la salida del comando "get_view"

set_view (\
    -0.084557205,   -0.469571352,    0.878824949,\
    -0.988504648,    0.150396124,   -0.014752502,\
    -0.125242501,   -0.869981527,   -0.476899385,\
     0.000000000,    0.000000000, -165.301025391,\
   -30.368568420,   72.776771545,   15.696001053,\
   146.079421997,  184.522674561,  -20.000000000 )

# Iluminación
# Puedes cambiar la iluminación con una gran cantidad de posibilidades
# https://pymolwiki.org/index.php/Light
# https://pymolwiki.org/index.php/Light_count
# https://pymol.org/dokuwiki/doku.php?id=setting:light

# Elijo últimas opciones de edición para renderizar
set antialias, 2
set opaque_background, off
set ray_trace_gain, 0.1
set ray_trace_mode, 0
set ray_shadows, 1

# Renderizamos y guardamos
ray 900,900
png monomero_mutaciones.png, dpi=300

# Para ejecutar el script desde la terminal:
# >>> pymol -qc monomero_mutaciones.pml
