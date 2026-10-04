
ROOT_HTML := $(wildcard *.html)
ROOT_HTML_OUT := $(addprefix out/,$(ROOT_HTML))
ROOT_CSS := $(wildcard *.css)
ROOT_CSS_OUT := $(addprefix out/,$(ROOT_CSS))

JOURNAL := $(wildcard food-journal/*.xml)
JOURNAL_OUT := $(patsubst food-journal/%.xml,out/food-journal/%.html,$(JOURNAL))
ESSAYS := $(wildcard essays/*.html)
ESSAYS_OUT := $(patsubst essays/%.html,out/essays/%.html,$(ESSAYS))
IMAGES := $(wildcard images/*)
IMAGES_OUT := $(patsubst images/%,out/images/%,$(IMAGES))

.PHONY: all

all: $(ROOT_HTML_OUT) $(ROOT_CSS_OUT) $(JOURNAL_OUT) $(ESSAYS_OUT) $(IMAGES_OUT)

$(ROOT_HTML_OUT): out/%.html: %.html
	mkdir -p out
	cp $< $@
	
$(ROOT_CSS_OUT): out/%.css: %.css
	mkdir -p out
	cp $< $@

$(JOURNAL_OUT): out/food-journal/%.html: food-journal/%.xml
	mkdir -p out/food-journal
	food-journal/build $< > $@

$(ESSAYS_OUT): out/essays/%.html: essays/%.html
	mkdir -p out/essays
	cp $< $@
	
$(IMAGES_OUT): out/images/%: images/%
	mkdir -p out/images
	cp $< $@
