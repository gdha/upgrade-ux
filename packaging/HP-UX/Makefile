product = upgrade-ux
psf_file = ./$(product).psf
main_script = ../../opt/upgrade-ux/bin/upgrade-ux
depot_dir = /tmp/$(product).depot.dir
log_dir = ../../var/opt/upgrade-ux/log

all: help

help:
	@echo "+-------------------------+"
	@echo "    upgrade-ux Makefile    "
	@echo "    =================    "
	@echo "    build: \"make depot\"  "
	@echo "    clean: \"make clean\"  "
	@echo "+-------------------------+"

.PHONY: clean

clean:
	@if [ `whoami` != "root" ]; then echo "Only root may remove packages"; exit 1; fi; \
	rm -rf $(depot_dir) ;  find $(log_dir) -type f -name '*.log' -exec rm {} \; ; \
	echo "Depot directory [$(depot_dir)] successfully removed"

man: ../../opt/upgrade-ux/man/upgrade-ux.8
	@echo "Build new man page on Linux (upgrade-ux.8.txt is the source)"
	@if [ -f ../../opt/upgrade-ux/man/upgrade-ux.8 ]; then cp -p ../../opt/upgrade-ux/man/upgrade-ux.8 ../../opt/upgrade-ux/man/upgrade-ux.8.save; \
	compress ../../opt/upgrade-ux/man/upgrade-ux.8 ; mv -f ../../opt/upgrade-ux/man/upgrade-ux.8.Z ../../opt/upgrade-ux/man/upgrade-ux.8 ; fi

validate:
	@echo "Validating the scripts"
	find ../../etc/opt/upgrade-ux -name '*.conf' | xargs -n 1 ksh -n ; \
	ksh -n $(main_script) ; \
	find ../../opt/upgrade-ux/lib -name "*.sh" | xargs -n 1 ksh -n ; \
	find ../../opt/upgrade-ux/scripts -name "*.sh" | xargs -n 1 ksh -n ; \
	echo "Scripts were successfully validated."

rewrite: $(psf_file) $(main_script)
	@echo "Update the $(psf_file) file"
	ver=`/usr/bin/grep ^VERSION= $(main_script) | cut -d= -f2` ; \
	cp -p $(psf_file) $(psf_file).save ; \
	sed -e 's#number.*#number '$$ver'#' -e 's#revision.*#revision '$$ver'#g' < $(psf_file).save >$(psf_file); 
	@echo "Update the $(main_script) script with current date"
	today=`date +'%d-%b-%Y'` ; \
	cp -p $(main_script) $(main_script).save ; \
	sed -e 's#RELEASE_DATE=.*#RELEASE_DATE='$$today'#' < $(main_script).save > $(main_script);
	
depot: clean validate man rewrite
	@/usr/sbin/swpackage -vv -s $(psf_file) -x layout_version=1.0 -d $(depot_dir) ; \
	rel=`/usr/bin/grep 'number' $(psf_file) | awk '{print $$2}'` ; \
	ymd=`date +%Y%m%d` ; \
	depot_file="/tmp/$(product)_"$$rel"_"$$ymd".depot" ; \
	/opt/ignite/bin/make_bundles -b -i -n "UPGRADE-UX" -t "upgrade-ux for HP-UX" \
	-o /tmp/upgrade-ux_bundle.psf -r $$rel $(depot_dir) ; \
	/usr/sbin/swpackage -s /tmp/upgrade-ux_bundle.psf -xlayout_version=1.0 -x reinstall_files=true -d  $(depot_dir) ; \
	/usr/sbin/swpackage -vv -d $$depot_file  -x target_type=tape -s $(depot_dir) \* ; \
	echo "File depot location is $$depot_file" ; \
	rm -f /tmp/upgrade-ux_bundle.psf ; \
	mv -f ../../opt/upgrade-ux/man/upgrade-ux.8.save ../../opt/upgrade-ux/man/upgrade-ux.8 ; \
	mv -f $(psf_file).save $(psf_file) ; \
	mv -f $(main_script).save $(main_script) ; \
	echo "Done."

