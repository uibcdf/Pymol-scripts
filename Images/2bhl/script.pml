# Loading systems

load 2bhl.pdb, dimer
load 2bh9.pdb, monomer_2bh9_A
load 2bh9.pdb, monomer_2bh9_B

# Removing solvent

remove solvent, dimer
remove solvent, monomer_2bh9_A
remove solvent, monomer_2bh9_B

# Making Mutations

## Veracruz: residue ARG 365 to HIS. 

cmd.wizard("mutagenesis")
cmd.do("refresh_wizard")
cmd.get_wizard().set_mode("HIS")
cmd.get_wizard().do_select("/dimer//A/365")
cmd.frame(1) # Select the first rotamer, which is most probable
cmd.get_wizard().apply()
cmd.wizard(None)

cmd.wizard("mutagenesis")
cmd.do("refresh_wizard")
cmd.get_wizard().set_mode("HIS")
cmd.get_wizard().do_select("/dimer//B/365")
cmd.frame(1) # Select the first rotamer, which is most probable
cmd.get_wizard().apply()
cmd.wizard(None)

## Seattle: residue ASP 282 to HIS. 

cmd.wizard("mutagenesis")
cmd.do("refresh_wizard")
cmd.get_wizard().set_mode("HIS")
cmd.get_wizard().do_select("/dimer//A/282")
cmd.frame(1) # Select the first rotamer, which is most probable
cmd.get_wizard().apply()
cmd.wizard(None)

cmd.wizard("mutagenesis")
cmd.do("refresh_wizard")
cmd.get_wizard().set_mode("HIS")
cmd.get_wizard().do_select("/dimer//B/282")
cmd.frame(1) # Select the first rotamer, which is most probable
cmd.get_wizard().apply()
cmd.wizard(None)

## Mexico DF: residue THR 65 to ALA. 

cmd.wizard("mutagenesis")
cmd.do("refresh_wizard")
cmd.get_wizard().set_mode("ALA")
cmd.get_wizard().do_select("/dimer//A/65")
cmd.frame(1) # Select the first rotamer, which is most probable
cmd.get_wizard().apply()
cmd.wizard(None)

cmd.wizard("mutagenesis")
cmd.do("refresh_wizard")
cmd.get_wizard().set_mode("ALA")
cmd.get_wizard().do_select("/dimer//B/65")
cmd.frame(1) # Select the first rotamer, which is most probable
cmd.get_wizard().apply()
cmd.wizard(None)

# Adding Hydrogens

h_add dimer
h_add monomer_2bh9_A
h_add monomer_2bh9_B

# Alignments using CAs
align monomer_2bh9_A, dimer and chain A
align monomer_2bh9_B, dimer and chain B

# Making selections

select monomer_A, dimer and chain A
select BG6_A,  monomer_A and resid 1510 and resname BG6

select monomer_B, dimer and chain B
select BG6_B,  monomer_B and resid 1508 and resname BG6

select NAP_A1, monomer_2bh9_A and resid 799 and resname NAP
select NAP_A2, monomer_2bh9_A and resid 811 and resname NAP

select NAP_B1, monomer_2bh9_B and resid 799 and resname NAP
select NAP_B2, monomer_2bh9_B and resid 811 and resname NAP

select NAP_As, NAP_A1 or NAP_A2
select NAP_Bs, NAP_B1 or NAP_B2
select NAPs, NAP_As or NAP_Bs
select BG6s, BG6_B or BG6_A
select ligands, NAPs or BG6s

sel veracruz_A, monomer_A and resid 365
sel veracruz_B, monomer_B and resid 365

sel seattle_A, monomer_A and resid 282
sel seattle_B, monomer_B and resid 282

sel mexicodf_A, monomer_A and resid 65
sel mexicodf_B, monomer_B and resid 65

sel veracruz, veracruz_A or veracruz_B
sel seattle, seattle_A or seattle_B
sel mexicodf, mexicodf_A or mexicodf_B

# Reset canvas

bg_color white
hide everything, all

## Art in dimer

#show surface, monomer_A
#show surface, monomer_B
#set transparency, 0.95
#set surface_color, grey, monomer_A
#set surface_color, grey, monomer_B
show cartoon, monomer_A
show cartoon, monomer_B
set cartoon_color, wheat, monomer_A
set cartoon_color, white, monomer_B

## Art in mutations

show sticks, veracruz
set stick_radius, 0.5, veracruz
set stick_color, green, veracruz

show sticks, seattle
set stick_radius, 0.5, seattle
set stick_color, red, seattle

show sticks, mexicodf
set stick_radius, 0.5, mexicodf
set stick_color, yellow, mexicodf


## Art in ligands

show spheres, ligands
#set sphere_transparency=0.9, ligands
set sphere_scale, 0.8, ligands
set sphere_scale, 0.4, ligands and elem H
set stick_quality, 50, ligands
set sphere_quality, 4, ligands
color br0, NAPs 
color lightteal, BG6s

#show spheres, ligands
#show sticks, ligands
#set stick_radius, .20, ligands 
#set sphere_scale, .25, ligands
#set sphere_scale, .10, ligands and elem H
#set stick_quality, 50, ligands
#set sphere_quality, 4, ligands
#color br0, NAPs 
#color lightteal, BG6s

set_view (\
     0.242420346,    0.777297616,   -0.580549300,\
    -0.716414392,    0.546934485,    0.433143049,\
     0.654206634,    0.310911745,    0.689453721,\
    -0.000196271,   -0.000436872, -256.388580322,\
    11.427036285,  112.456512451,   24.581991196,\
   189.418807983,  323.338592529,  -20.000000000 )


cartoon automatic

set depth_cue, 0 
set ray_trace_mode, 0
set light_count,8
set spec_count,1
set shininess, 10
set specular, 0.25
set ambient,0
set direct,0
set reflect,1.5
set ray_shadow_decay_factor, 0.1
set ray_shadow_decay_range, 2
unset depth_cue
#ray 2400,2400
png test, width=2400, height=1600, dpi=300

