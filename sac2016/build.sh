#!/bin/bash
i_scirptdir=$(cd "$(dirname "$0")"; pwd)
cd $i_scirptdir/..

./gnuplot/plot.sh

cd $i_scirptdir

pdflatex -shell-escape paper
bibtex paper
pdflatex -shell-escape paper
pdflatex -shell-escape paper