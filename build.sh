#!/bin/bash
i_scirptdir=$(cd "$(dirname "$0")"; pwd)
$i_scirptdir/gnuplot/plot.sh
pdflatex -shell-escape paper
pdflatex -shell-escape paper
bibtex paper
pdflatex -shell-escape paper
