#!/bin/bash

# latex -shell-escape crc-paper
# bibtex crc-paper
# latex -shell-escape crc-paper
# latex -shell-escape crc-paper
# dvipdf crc-paper

pdflatex -shell-escape crc-paper
bibtex crc-paper
pdflatex -shell-escape crc-paper
sed 's|\\begin{thebibliography}{10}|\\begin{thebibliography}{10} \\vspace{.5em}|' < crc-paper.bbl > x
/bin/mv x crc-paper.bbl
pdflatex -shell-escape crc-paper
