set border 31 lw 0.3
set size 0.5, 0.5

set xlabel 'y^+'
set ylabel 'u^+' 

set key t l L

set logscale x

set xr [0.1:10000]
set yr [0:30]

set grid lw 0.1

ustar = 0.1 # put the value of friction velocity here
nu    = 2e-7

pl 'postProcessing/graphs/2000/lineA_U.xy' u ($1*ustar/nu):($2/ustar) w lp t '2000 iters'
rep x w l t 'u^+ = y^+'
# add a line to plot the log-law
rep 1/0.41*log(x) + 5.0  w l t 'u^+ = A ln y^+ + B'

set term post color enhanced eps font "Times, 14"
set out 'velocityInner.eps'
rep
