set key b r L
set yr [0:0.005]
set xlabel 'Re_x'
set ylabel 'c_f'
set border 31 lw 0.3
set size 0.5
#set ytics 0.001
#set xtics 500

Rex(x) = 1*x/2e-7
cf(x) = 0.455/(log(0.06*Rex(x)))**2

#pl 'coefficient.dat' t 'OpenFOAM' w l lw 3
pl 'wall-shear-stress-8000.csv' u 5:($1*-2) t 'OpenFOAM' w l
rep cf(x)  t 'White ' w l

#rep 0.00286 t 'CFL3D' w l lw 3
#rep 0.002852 t 'Fun3D' w l lw 3
 
set term post enhanced color font "Times,14"
set out 'cf.eps'
rep

