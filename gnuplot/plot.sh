#!/bin/bash
i_scirptdir=$(cd "$(dirname "$0")"; pwd)
i_rootdir=$(cd "$(dirname "$0")/.."; pwd)

cd $i_scirptdir

plot_file(){
    filename=$1
    i_title=$2
    xlabel=$3
    if [[ "X$4"!="X" ]]; then
        i_png=$4
    else
        i_png="${filename%.*}".png
    fi
    gnuplot -e "filename='$filename'; title='$i_title';xlabel='$xlabel'" $i_conf > $i_png
}

#i_conf=$i_scirptdir/scaleout.gp

#plot_file click_scaleout.dat "scale out for click application" 'worker count'

#plot_file click2_scaleout.dat "scale out for click application" 'worker count'

#plot_file click_singlenode.dat "performance of single node" 'client count'

#plot_file click2_singlenode.dat "performance of single node" 'client count'

i_conf=$i_scirptdir/scaleout_latency.gp
plot_file click_scaleout2.dat "Click application" "client count" "click_latency.png"
plot_file click2_scaleout2.dat "Click application" "client count" "click_wait_latency.png"
plot_file jquerychat_scaleout.dat "Chat application with JQuery" "client count" "jquerychat_latency.png"
plot_file angularchat_scaleout.dat "Chat application with Angular.js" "client count" "angularchat_latency.png"

i_conf=$i_scirptdir/scaleout_throughput.gp
plot_file click_scaleout2.dat "Click application with delay" "client count" "click_throughput.png"
plot_file click2_scaleout2.dat "Click application with delay" "client count" "click_wait_throughput.png"







#i_conf=$i_scirptdir/scaleout3.gp

#plot_file click2_scaleout2.dat "scale out for click application with wait" 'client count'


#i_conf=$i_scirptdir/latency_scaleout.gp

#plot_file jquerychat_scaleout.dat "scale out for jquery chat application" 'client count'