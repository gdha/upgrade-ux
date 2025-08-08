prefix = /opt/upgrade-ux
mandir = $(prefix)/man

txttargets = $(shell echo *.ronn)
htmltargets = $(patsubst %.ronn, %.html, $(txttargets))
# ronn is a tool to generate man-pages directly from MarkDown files
ronn := $(shell if type -p ronn >/dev/null; then echo ronn; fi)

all: docs

dist: docs

man: upgrade-ux.8

docs: upgrade-ux.8 $(htmltargets)

install: upgrade-ux.8
	install -Dp -m0644 upgrade-ux.8 $(DESTDIR)$(mandir)/man8/upgrade-ux.8

clean:
	rm -f *.8 *.html *.xml

%.8: %.8.ronn
	$(ronn) --roff $<

%.8.html: %.8.ronn
	$(ronn) --html $<
