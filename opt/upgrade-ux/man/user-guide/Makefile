prefix = /opt/upgrade-ux
datadir = $(prefix)/share
mandir = $(datadir)/man

txttargets = upgrade-ux-user-guide.txt
htmltargets = $(patsubst %.txt, %.html, $(txttargets))

all: docs

dist: docs

docs: $(htmltargets)

clean:
	rm -f *.html *.svg *.xml

%.html: %.txt
	asciidoc $<
