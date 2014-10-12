Thesis.pdf: Thesis.tex Thesis.toc __commands.tex __environments.tex __tum.tex __tumtitle.tex Chapter_Change_of_coordinates.tex Beweis.tex Preparation.tex Examples.tex Thesis.bbl
	pdflatex Thesis

Thesis.toc: Thesis.tex
	pdflatex Thesis

Thesis.bbl : Literatur.bib
	pdflatex Thesis
	bibtex Thesis
	pdflatex Thesis
