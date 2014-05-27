prefix = /opt/upgrade-ux
mandir = $(prefix)/man

txttargets = $(shell echo *.txt)
htmltargets = $(patsubst %.txt, %.html, $(txttargets))

all: docs

dist: docs

man: upgrade-ux.8

docs: upgrade-ux.8 $(htmltargets)
	make -C user-guide docs

install: upgrade-ux.8
	install -Dp -m0644 upgrade-ux.8 $(DESTDIR)$(mandir)/man8/upgrade-ux.8

clean:
	rm -f unconv.8 *.html *.xml
	make -C user-guide clean

%.8.html: %.8.txt
	asciidoc -d manpage $<

%.8: %.8.xml
	xmlto man $<

%.html: %.txt
	asciidoc $<

%.8.xml: %.8.txt
	asciidoc -b docbook -d manpage $<
