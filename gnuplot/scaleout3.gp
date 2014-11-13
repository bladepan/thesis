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


set ylabel "Throughput"
set y2label "Latency"

set ytics nomirror in
set y2tics nomirror

set yrange [0:*]
set y2range [0:*]

# this is temporary

# filename is a parameter
plot filename u 1:2 t 'Throughput - 1 worker' with linespoints axes x1y1,\
"" u 1:3 t 'Latency - 1 worker' with linespoints axes x1y2,\
"" u 1:4 t 'Throughput - 2 workers' with linespoints axes x1y1,\
"" u 1:5 t 'Latency - 2 workers' with linespoints axes x1y2,\
"" u 1:6 t 'Throughput - 4 workers' with linespoints axes x1y1,\
"" u 1:7 t 'Latency - 4 workers' with linespoints axes x1y2,\
"" u 1:8 t 'Throughput - 5 workers' with linespoints axes x1y1,\
"" u 1:9 t 'Latency - 5 workers' with linespoints axes x1y2,\
"" u 1:10 t 'Throughput - 8 workers' with linespoints axes x1y1,\
"" u 1:11 t 'Latency - 8 workers' with linespoints axes x1y2
#
