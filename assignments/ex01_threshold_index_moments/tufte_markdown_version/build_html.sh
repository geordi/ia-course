#!/bin/sh

pp -html -import=./pp-macros/all.pp index.pp.md | pandoc -o index.html -s --template=./templates/tufte.html5 --mathjax --no-highlight
