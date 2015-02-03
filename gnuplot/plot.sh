#!/bin/bash
i_scirptdir=$(cd "$(dirname "$0")"; pwd)
i_rootdir=$(cd "$(dirname "$0")/.."; pwd)

cd $i_scirptdir

plot_file(){
    filename=$1
    i_title=$2
    xlabel=$3
    if [[ "X$4"!="X" ]]; then
        i_output=$4".eps"
    else
        echo should specify output file name
        exit 1
    fi
    echo plot $i_output
    gnuplot -e "filename='$filename';title='$i_title';xlabel='$xlabel';output='$i_output'" $i_conf
}

echo plot latency graphs
i_conf=$i_scirptdir/scaleout_latency.gp
plot_file click_scaleout.dat "Click back to back" "client count" "click_latency"
plot_file click_wait_scaleout.dat "Human paced click application" "client count" "click_wait_latency"
plot_file jquerychat_scaleout.dat "Chat application with JQuery" "client count" "jquerychat_latency"
plot_file angularchat_scaleout.dat "Chat application with Angular.js" "client count" "angularchat_latency"

echo plot throughput graphs
i_conf=$i_scirptdir/scaleout_throughput.gp
plot_file click_scaleout.dat "Click application" "client count" "click_throughput"
plot_file click_wait_scaleout.dat "Click application with delay" "client count" "click_wait_throughput"

echo plot system resource consumption graph
gnuplot resource_consumption.gp