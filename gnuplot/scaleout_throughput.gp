# Gnuplot script file for plotting data
reset
set terminal postscript eps enhanced color 16
set output output
set samples 10000
# the default is NAN
set datafile missing "Null"
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title title
set xlabel xlabel


set ylabel "Throughput(operations/second)"


set ytics nomirror in

set yrange [0:*]

# set xtics font ",12"
# set ytics font ",12"
# set y2tics font ",12"
# set key font ",12"

# filename is a parameter
plot filename  u 1:2 t 'Throughput - 1 worker' with linespoints axes x1y1,\
"" u 1:4 t 'Throughput - 2 workers' with linespoints axes x1y1,\
"" u 1:6 t 'Throughput - 4 workers' with linespoints axes x1y1,\
"" u 1:8 t 'Throughput - 8 workers' with linespoints axes x1y1,\
"" u 1:10 t 'Throughput - 9 workers' with linespoints axes x1y1,\
"" u 1:12 t 'Throughput - 10 workers' with linespoints axes x1y1,\
"" u 1:14 t 'Throughput - 12 workers' with linespoints axes x1y1
#
