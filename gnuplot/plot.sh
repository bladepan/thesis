#!/bin/bash
i_scirptdir=$(cd "$(dirname "$0")"; pwd)
i_rootdir=$(cd "$(dirname "$0")/.."; pwd)

cd $i_scirptdir

plot_file(){
    filename=$1
    i_title=$2
    xlabel=$3
    i_png="${filename%.*}".png
    gnuplot -e "filename='$filename'; title='$i_title';xlabel='$xlabel'" $i_scirptdir/scaleout.gp > $i_png
}

plot_file click_scaleout.dat "scale out for click function" 'worker count'

plot_file click2_scaleout.dat "scale out for click function" 'worker count'

plot_file click_singlenode.dat "performance of single node" 'client count'

plot_file click2_singlenode.dat "performance of single node" 'client count'