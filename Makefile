SOURCES=$(wildcard *.md)
OBJECTS=article.pdf

all:	$(OBJECTS)

article.inter: $(SOURCES)
	@cat $(SOURCES) > article.inter

clean:
	@rm -rf $(OBJECTS) article.inter

%.pdf:	%.inter
	@echo "=> Building $@"
	@pandoc --from markdown+pipe_tables --template templates/eisvogel-cp.tex -N --toc --output=$@ --listings --no-highlight -f markdown+implicit_figures $<



