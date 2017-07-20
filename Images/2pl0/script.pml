load 2pl0.pdb

remove solvent

select protein, chain A
select imatinib, resname STI

bg_color white

hide lines, protein
show surface, protein
set transparency, 0.7
set surface_color, marine, protein
show cartoon, protein
set cartoon_color, marine, protein

show spheres, imatinib
util.cbao imatinib

set_view (\
     0.812490106,   -0.533163249,   -0.235763222,\
     0.109224021,    0.536482751,   -0.836809874,\
     0.572646022,    0.654149473,    0.494122833,\
    -0.000253588,    0.000127252, -152.205123901,\
    30.163061142,   18.254085541,   14.142078400,\
  -3523.860839844, 3828.307861328,  -20.000000000 )

set antialias, 1
set surface_quality, 2

set opaque_background, off
set ray_trace_mode, 1
ray 3400, 2400
png test.png, dpi=300

