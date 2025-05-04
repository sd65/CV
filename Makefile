FILE := CV_Sylvain-Doignon
PDF := $(FILE).pdf
THUMB := $(FILE).thumbnail.png

DOCKER_IMAGE_NAME := latex

.PHONY: all build clean thumbnail watch prepare

all: build

build: $(FILE).tex
	docker run --rm -i -v "$(PWD)":/data latex pdflatex $(FILE).tex

clean:
	rm -f $(FILE).{log,out,aux}

thumbnail:
	docker run --rm -i -v "$(PWD)":/data $(DOCKER_IMAGE_NAME) evince-thumbnailer --size=500 $(PDF) $(THUMB)

watch:
	fswatch -o $(FILE).tex customHead.inc.tex | \
		xargs -n1 -I{} sh -c 'docker run --rm -i -v "$(PWD)":/data $(DOCKER_IMAGE_NAME) xelatex $(FILE).tex && open $(PDF)'

prepare:
	docker build -t $(DOCKER_IMAGE_NAME) .
