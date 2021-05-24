#!/usr/bin/env bash
# We need a build system for this if we keep modifying it.
# For now a shell script will do

# MARKDOWN

# Dependencies:
# You need eisvogel template for markdown for the nice looking pdfs.
# https://github.com/Wandmalfarbe/pandoc-latex-template

# Here is how I rendered the MD files last time...
# Add license (only once).
# for i in */*.md; do cat ./license.txt >> "$i"; done

# Use Pandoc to render PDFs
for i in */*.md; do pandoc "$i" -o "${i%.md}".pdf --template eisvogel; done 
for i in */*.md; do pandoc "$i" -o "${i%.md}".pdf --template eisvogel; done 

# Latex Beamer

# Dependencies:
# The presentation slide decks are created with beamer. 
# So you need a build environment with these.

for d in $(find ./ -maxdepth 1 -type  -d)
do 
	cd $d
	latexmk -pdf *.tex
	latexmk -c
	cd ..
done
