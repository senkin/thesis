Sergey Senkin's PhD Thesis
======

Submitted on April 25, 2014, defended on June 9, 2014 at the University of Bristol.

To compile and view:
```
# get the code from the repository
git clone https://github.com/senkin/thesis
cd thesis

# pre-compiled pdf for the impatient
open thesis.pdf

# to build from scratch, run pdflatex once
pdflatex thesis.tex

# now set up Feynman diagrams
cd ThesisFigs
mpost feynman-diagrams.mp 
cd ..

# set up bibliography
bibtex thesis

# pdflatex once (or twice) more
pdflatex thesis.tex

# all set
open thesis.pdf
```
