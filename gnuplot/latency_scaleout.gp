# Gnuplot script file for plotting data
reset
set terminal png
set samples 10000
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title title
set xlabel xlabel


set ylabel "Latency"


set ytics nomirror in

set yrange [0:*]


# filename is a parameter
plot filename u 1:2 t 'Latency - 1 worker' with linespoints axes x1y1,\
"" u 1:3 t 'Latency - 2 workers' with linespoints axes x1y1,\
"" u 1:4 t 'Latency - 4 workers' with linespoints axes x1y1,\
"" u 1:5 t 'Latency - 8 workers' with linespoints axes x1y1
#
