# set terminal png size 800,1000 12
# set output "mem.png"

# set terminal latex
# set output "mem.tex"

set terminal postscript eps enhanced color 12
set output "resource_consumption.eps"

set multiplot layout 3,1
# set bmargin 5

set samples 20000
#
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically

set xlabel "Time(s)"


set ylabel "CPU Percentage"
set y2label "MB"

set ytics nomirror in
set y2tics nomirror

set xtics font ",10"
set ytics font ",10"
set y2tics font ",10"
set key font ",10"

# show only part of x
set xrange [500:5000]
set yrange [0:*]
set y2range [0:*]

set key off
set title "100 clients"

plot 'test660_worker1_sysmon.dat' u ($1 / 1000):2 t 'cpu(%)' w lines axes x1y1,\
"" u ($1 / 1000):3 t 'rss(MB)' w lines axes x1y2, \
"" u ($1 / 1000):4 t 'HeapTotal(MB)' w lines axes x1y2, \
"" u ($1 / 1000):5 t 'HeapUsed(MB)' w lines axes x1y2
#
#
set key at 4500,80
set title "200 clients"

plot 'test661_worker1_sysmon.dat' u ($1 / 1000):2 t 'cpu(%)' w lines axes x1y1,\
"" u ($1 / 1000):3 t 'rss(MB)' w lines axes x1y2, \
"" u ($1 / 1000):4 t 'HeapTotal(MB)' w lines axes x1y2, \
"" u ($1 / 1000):5 t 'HeapUsed(MB)' w lines axes x1y2
#
set key off
set title "300 clients"

plot 'test662_worker1_sysmon.dat' u ($1 / 1000):2 t 'cpu(%)' w lines axes x1y1,\
"" u ($1 / 1000):3 t 'rss(MB)' w lines axes x1y2, \
"" u ($1 / 1000):4 t 'HeapTotal(MB)' w lines axes x1y2, \
"" u ($1 / 1000):5 t 'HeapUsed(MB)' w lines axes x1y2
#
unset multiplot
#
#
#
#
