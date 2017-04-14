FILE = CV_Sylvain-Doignon

.PHONY: build clean release

release: clean
	evince-thumbnailer --size=500 $(FILE).pdf $(FILE).thumbnail.png

clean: build
	rm $(FILE).{log,out,aux}

build: $(FILE).tex
	TEXINPUTS=.:./moderncv/: pdflatex $(FILE).tex
