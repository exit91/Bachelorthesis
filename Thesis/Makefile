DOC := doc/Appendix.tex doc/Beweis.tex doc/CubicCurves.tex doc/Elimination.tex doc/Examples.tex doc/GeneralFacts.tex doc/GroupAction.tex doc/Intro.tex doc/Lines.tex doc/OtherProofs.tex doc/PlaneConics.tex doc/ProjectiveSpace.tex doc/SingularitiesTangentPlane.tex

Thesis.pdf: Thesis.tex Thesis.toc __commands.tex __environments.tex __tum.tex __tumtitle.tex Chapter_Change_of_coordinates.tex Thesis.bbl $(DOC)
	pdflatex Thesis

Thesis.toc: Thesis.tex
	pdflatex Thesis

Thesis.bbl : Literatur.bib
	pdflatex Thesis
	bibtex Thesis
	pdflatex Thesis
