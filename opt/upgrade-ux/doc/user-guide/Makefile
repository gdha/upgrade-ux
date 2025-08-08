prefix = /opt/upgrade-ux

htmltarget = upgrade-ux-user-guide.html

all: docs

dist: docs

docs:
	cat *.md | ronn --html > $(htmltarget)

clean:
	rm -f *.html *.svg *.xml

upload: $(htmltarget)
	lftp -e 'put -O /wwwroot/projects/upgrade-ux $(htmltarget) ; bye' it3.be.apache52.cloud.telenet.be

