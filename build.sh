#!/bin/bash
pdflatex -shell-escape paper
pdflatex -shell-escape paper
bibtex paper
pdflatex -shell-escape paper
