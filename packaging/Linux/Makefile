product = upgrade-ux
name = $(product)

specfile = rpm/$(name).spec
dscfile = debian/$(name).dsc
main_script = ../../opt/upgrade-ux/bin/upgrade-ux
log_dir = ../../var/opt/upgrade-ux/log

DESTDIR =
OFFICIAL =

version := $(shell grep ^VERSION= $(main_script) | cut -d= -f2)

distversion = $(version)
debrelease = 0
rpmrelease = %nil

### Get the branch information from git
ifeq ($(OFFICIAL),)
ifneq ($(shell which git),)
git_date := $(shell git log -n 1 --format="%ai")
git_ref := $(shell git symbolic-ref -q HEAD)
git_branch = $(lastword $(subst /, ,$(git_ref)))
endif
else
git_branch = rear-$(version)
endif
git_branch ?= master

date := $(shell date --date="$(git_date)" +%Y%m%d%H%M)
release_date := $(shell date --date="$(git_date)" +%Y-%m-%d)

prefix = /opt/$(product)
sysconfdir = /etc$(prefix)
bindir = $(prefix)/bin
scriptdir = $(prefix)/scripts
libdir = $(prefix)/lib
localstatedir = /var$(prefix)



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
	find ../../opt/upgrade-ux/lib -name "*.sh" | xargs -n 1 ksh -n ; \
	find ../../opt/upgrade-ux/scripts -name "*.sh" | xargs -n 1 ksh -n ; \
	echo "Scripts were successfully validated."

rewrite: $(specfile) $(main_script)
	@echo  -e "\033[1m== Update the $(specfile) file==\033[0;0m"
	cp -p $(specfile) $(specfile).save ; \
	sed -e 's#number.*#number '$$version'#' -e 's#revision.*#revision '$$version'#g' < $(specfile).save >$(specfile); 
	@echo "Update the $(dscfile) file"
	cp -p $(dscfile) $(dscfile).save ; \
	sed -e 's#number.*#number '$$version'#' -e 's#revision.*#revision '$$version'#g' < $(dscfile).save > $(dscfile) ;
	@echo "Update the $(main_script) script with current date"
	today=`date +'%d-%b-%Y'` ; \
	cp -p $(main_script) $(main_script).save ; \
	sed -e 's#RELEASE_DATE=.*#RELEASE_DATE='$$today'#' < $(main_script).save > $(main_script);

restore:
	echo -e "\033[1m== Restoring $(specfile) and $(main_script) ==\033[0;0m"
	mv -f $(specfile).save $(specfile)
	mv -f $(dscfile).save $(dscfile)
	mv -f $(main_script).save $(main_script)

rpm: dist
	@echo -e "\033[1m== Building RPM package $(name)-$(distversion) ==\033[0;0m"
	rpmbuild -tb --clean \
		--define "_rpmfilename %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm" \
		--define "debug_package %{nil}" \
		--define "_rpmdir %(pwd)" ../../$(name)-$(distversion).tar.gz

dist: clean validate man doc rewrite $(name)-$(distversion).tar.gz restore

$(name)-$(distversion).tar.gz:
	@echo -e "\033[1m== Building archive $(name)-$(distversion) ==\033[0;0m"
	cd ../.. ; \
	git checkout $(git_branch) ; \
	git ls-tree -r --name-only --full-tree $(git_branch) | grep -v -E '(HP-UX|/hp/|/aix/|/bsd/|/sunos/)' | \
		tar -czf $(name)-$(distversion).tar.gz --transform='s,^,$(name)-$(distversion)/,S' --files-from=-


deb: dist
	@echo -e "\033[1m== Building DEB package $(name)-$(distversion) ==\033[0;0m"
	cp -r packaging/debian/ .
	chmod 755 debian/rules
	fakeroot debian/rules clean
	fakeroot dh_install
	fakeroot debian/rules binary
	-rm -rf debian/

install-config:
	@echo -e "\033[1m== Installing configuration ==\033[0;0m"
	install -d -m0700 $(DESTDIR)/$(sysconfdir)
	cp -a ../../etc/opt/upgrade-ux/. $(DESTDIR)/$(sysconfdir)/

install-bin:
	@echo -e "\033[1m== Installing binary ==\033[0;0m"
	install -Dp -m0755 $(main_script) $(DESTDIR)/$(bindir)/$(product)

install-lib:
	@echo -e "\033[1m== Installing library functions ==\033[0;0m"
	install -d -m0755 $(DESTDIR)/$(libdir)
	cp -a ../../opt/upgrade-ux/lib/. $(DESTDIR)/$(libdir)/

install-data:
	@echo -e "\033[1m== Installing scripts ==\033[0;0m"
	install -d -m0755 $(DESTDIR)/$(scriptdir)
	cp -a ../../opt/upgrade-ux/scripts/. $(DESTDIR)/$(scriptdir)/

install-var:
	@echo -e "\033[1m== Installing working directory ==\033[0;0m"
	install -d -m0755 $(DESTDIR)/$(localstatedir)

install-doc:
	@echo -e "\033[1m== Installing documentation ==\033[0;0m"
	make -C ../../opt/upgrade-ux/man install

install: validate man doc install-config rewrite install-bin restore install-lib install-data install-var install-doc

