FILE = CV_Sylvain-Doignon

.PHONY: build clean

clean: build
	rm $(FILE).{log,out,aux}

build: $(FILE).tex
	TEXINPUTS=.:./moderncv/: pdflatex $(FILE).tex
