set key b r L
set yr [0:0.0035]
set xlabel 'iteration'
set ylabel 'C_D'
set border 31 lw 0.3
set size 0.5
set ytics 0.001
set xtics 500

pl 'coefficient.dat' t 'OpenFOAM' w l lw 3
rep 0.00286 t 'CFL3D' w l lw 3
rep 0.002852 t 'Fun3D' w l lw 3
 
set term post enhanced color font "Times,14"
set out 'CD.eps'
rep

