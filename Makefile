## R Markdown extension
RMDEXT = Rmd

## All Rmd files in the working directory
RMDSRC = $(filter-out README.Rmd, $(wildcard *.$(RMDEXT)))

## Target
RMDS=$(RMDSRC:.Rmd=.R)

PURL=$(RMDS:.Rmd=.R)

purl:	$(PURL)

%.R: %.Rmd
	Rscript -e "require(knitr); purl('$<')"


.PHONY: clean
clean:
	rm -f *.R *.Rout *.pdf
