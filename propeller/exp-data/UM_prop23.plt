# example plot UM prop 23 data

reset 

set encoding utf8

set datafile separator ","

#set terminal qt 0
set xlabel 'J_{A}'
set ylabel 'K_{T}, 10K_{Q}, η'
set xrange [0:1.2]
set yrange [0:1.0]
plot 'UM_prop23.dat' using 5:6 w p title 'K_{T} 1100rpm',\
     'UM_prop23.dat' using 11:12 w p title '10K_{Q} 1100rpm',\
     'UM_prop23.dat' using 13:14 w p title 'η 1100rpm'


#set terminal qt 1
set xlabel 'J_{A}'
set ylabel 'K_{T}, 10K_{Q}, η'
set xrange [0:1.2]
set yrange [0:1.0]
plot 'UM_prop23_spline.dat' using 1:2 w l smooth csplines title 'K_{T}',\
     'UM_prop23_spline.dat' using 3:4 w l smooth csplines title '10K_{Q}',\
     'UM_prop23_spline.dat' using 5:6 w l smooth csplines title 'η'
