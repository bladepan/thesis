# Gnuplot script file for plotting data
reset
set terminal postscript eps enhanced color 16
# output is an variable
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


set ylabel "Latency(ms)"


set ytics nomirror in

set yrange [0:* < 200]

# filename is a parameter
plot filename  u 1:3 t '1 worker' with linespoints axes x1y1,\
"" u 1:5 t '2 workers' with linespoints axes x1y1,\
"" u 1:7 t '4 workers' with linespoints axes x1y1,\
"" u 1:9 t '6 workers' with linespoints axes x1y1,\
"" u 1:11 t '8 workers' with linespoints axes x1y1,\
"" u 1:13 t '9 workers' with linespoints axes x1y1,\
"" u 1:15 t '10 workers' with linespoints axes x1y1
#
