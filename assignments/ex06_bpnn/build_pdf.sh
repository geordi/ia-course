#!/bin/sh

pp -pdf -import=./pp-macros/all.pp index.pp.md | \
pandoc -o index.pdf -f markdown+raw_tex --pdf-engine=xelatex  -V graphics=true \
--template=./templates/tufte-handout.tex -V documentclass=tufte-handout \
-V strikeout=true -V "header-includes=\usepackage{color}" --filter pandoc-crossref --no-highlight


#pandoc -o neco.pdf -f markdown+raw_tex --template=default.latex \
#--pdf-engine=xelatex -V graphics=true \
#-V strikeout=true -V "header-includes=\usepackage{soul}" \
#-V "header-includes=\usepackage{color}"
