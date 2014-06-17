product = upgrade-ux
name = $(product)

specfile = rpm/$(name).spec
dscfile = debian/$(name).dsc
main_script = ../../opt/upgrade-ux/bin/upgrade-ux
log_dir = ../../var/opt/upgrade-ux/log

DESTDIR =
OFFICIAL =

version := $(shell /usr/bin/grep ^VERSION= $(main_script) | cut -d= -f2)

distversion = $(version)
debrelease = 0
rpmrelease = %nil






all: help

help:
	@echo "+-------------------------+"
	@echo "    upgrade-ux Makefile    "
	@echo "    =================    "
	@echo "    rpm: \"make rpm\"  "
	@echo "    clean: \"make clean\"  "
	@echo "+-------------------------+"

.PHONY: clean

clean:
	rm -f $(product)-$(distversion).tar.gz

man: ../../opt/upgrade-ux/man/upgrade-ux.8
	@echo "Build new man page (upgrade-ux.8.txt is the source)"
	make -C ../../opt/upgrade-ux/man man

doc: ../../opt/upgrade-ux/doc/user-guide/upgrade-ux-user-guide.html
	@echo "Prepare documentation"
	make -C ../../opt/upgrade-ux/doc/user-guide docs

validate:
	@echo "Validating the scripts"
	find ../../etc/opt/upgrade-ux -name '*.conf' | xargs -n 1 ksh -n ; \
	ksh -n $(main_script) ; \
	find ../../opt/upgrade-ux/scripts -name "*.sh" | xargs -n 1 ksh -n ; \
	echo "Scripts were successfully validated."

rewrite: $(specfile) $(main_script)
	@echo "Update the $(specfile) file"
	cp -p $(specfile) $(specfile).save ; \
	sed -e 's#number.*#number '$$version'#' -e 's#revision.*#revision '$$version'#g' < $(specfile).save >$(specfile); 
	@echo "Update the $(main_script) script with current date"
	today=`date +'%d-%b-%Y'` ; \
	cp -p $(main_script) $(main_script).save ; \
	sed -e 's#RELEASE_DATE=.*#RELEASE_DATE='$$today'#' < $(main_script).save > $(main_script);

rpm: dist
	@echo -e "\033[1m== Building RPM package $(name)-$(distversion) ==\033[0;0m"
	rpmbuild -tb --clean \
		--define "_rpmfilename %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm" \
		--define "debug_package %{nil}" \
		--define "_rpmdir %(pwd)" $(name)-$(distversion).tar.gz

dist: clean validate man doc rewrite $(name)-$(distversion).tar.gz restore

