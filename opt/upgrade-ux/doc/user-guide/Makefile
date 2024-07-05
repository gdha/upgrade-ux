prefix = /opt/upgrade-ux

txttargets = upgrade-ux-user-guide.txt
htmltargets = $(patsubst %.txt, %.html, $(txttargets))

all: docs

dist: docs

docs: $(htmltargets)

clean:
	rm -f *.html *.svg *.xml

%.html: %.txt
	asciidoc $<

upload: $(htmltargets)
	lftp -e 'put -O /wwwroot/projects/upgrade-ux $(htmltargets) ; bye' it3.be.apache52.cloud.telenet.be

