DOC := doc/Appendix.tex doc/Beweis.tex doc/CubicCurves.tex doc/Elimination.tex doc/Examples.tex doc/GeneralFacts.tex doc/GroupAction.tex doc/Intro.tex doc/OtherProofs.tex doc/PlaneConics.tex doc/ProjectiveSpace.tex doc/SingularitiesTangentPlane.tex doc/Notation.tex
IMG := img/cuspidal.pdf img/nodal.pdf img/intersectiongraph.pdf
SRC := ../CuspidalCase.sage ../NodalCase.sage

Thesis.pdf: Thesis.tex Thesis.toc __commands.tex __environments.tex __tum.tex __tumtitle.tex Chapter_Change_of_coordinates.tex Thesis.bbl $(DOC) $(SRC) $(IMG)
	pdflatex Thesis

Thesis.toc: Thesis.tex
	pdflatex Thesis

Thesis.bbl : Literatur.bib
	pdflatex Thesis
	bibtex Thesis
	pdflatex Thesis

img/intersectiongraph.pdf: img/intersectiongraph.dot
	dot -Tpdf img/intersectiongraph.dot > img/intersectiongraph.pdf

img/cuspidal.pdf: img/cuspidal.gnuplot
	cd img && gnuplot cuspidal.gnuplot

img/nodal.pdf: img/nodal.gnuplot
	cd img && gnuplot nodal.gnuplot
