SOURCES=$(wildcard text/*.md)
OBJECTS=article.pdf

all:	$(OBJECTS)

article.inter: $(SOURCES)
	@rm -f article.inter
	@for src in $(SOURCES); do cat $$src >> article.inter; echo "" >> article.inter; echo "" >> article.inter; done

clean:
	@rm -rf $(OBJECTS) article.inter

%.pdf:	%.inter
	@echo "=> Building $@"
	@pandoc --from markdown+pipe_tables --template templates/eisvogel-cp.tex -N --toc --output=$@ --listings --no-highlight -f markdown+implicit_figures $<



