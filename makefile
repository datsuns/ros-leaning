.PHONY: default build auto auto_setup

SRCEXT		:= .txt
DESTEXT		:= .png
SRCDIR    := input
DESTDIR   := images
LIB       := tool/plantuml.jar
AUTOTOOL	:= tool/auto.go

IMGSRC   := $(wildcard $(SRCDIR)/*)
FNAMES   := $(notdir $(IMGSRC))
IMGNAMES := $(FNAMES:$(SRCEXT)=$(DESTEXT))
DEST     := $(addprefix $(DESTDIR)/,$(IMGNAMES))

default: build

build: $(DEST)

$(DESTDIR)/%$(DESTEXT): $(SRCDIR)/%$(SRCEXT)
	java -jar $(LIB) -charset UTF-8 -tpng -o ../$(DESTDIR) $<

auto:
	go run $(AUTOTOOL) ./$(SRCDIR)

auto_setup:
	@echo 'please install golang first.'
	go get -u github.com/fsnotify/fsnotify

