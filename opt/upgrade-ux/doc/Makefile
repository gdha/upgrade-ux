prefix = /opt/upgrade-ux
docdir = $(prefix)/doc

all: docs

dist: docs


docs:
	make -C user-guide docs

install: 
	install -Dp -m0644 user-guide/upgrade-ux-user-guide.html $(DESTDIR)$(docdir)/

clean:
	rm -f unconv.8 *.html *.xml
	make -C user-guide clean

