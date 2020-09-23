set border 31 lw 0.3
set size 0.5, 0.5

set xlabel 'u/U' 
set ylabel 'y/L'

set key t l L

set xr [0:1.1]


fx = 1.0
fy = 2.0

pl 'postProcessing/graphs/2000/lineA_U.xy' u ($2/fx):($1/fy) w lp t '2000 iters'
repl 'postProcessing/graphs/1000/lineA_U.xy' u ($2/fx):($1/fy) w lp \
                                             t '1000 iters'

set term post color enhanced eps font "Times, 14"
set out 'velocityOuter.eps'
rep
