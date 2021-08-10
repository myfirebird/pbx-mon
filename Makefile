
.PHONY: install config script

install:
	@/usr/bin/cp -Rf cdr /var
	@/usr/bin/chown -R nginx:pbx /var/cdr
	echo -e "->\033[37m install cdr module               \033[32m [ OK ] \033[0m"
	@/usr/bin/rm -rf /var/www
	@/usr/bin/cp -Rf src /var/www
	@/usr/bin/chown -R nginx:pbx /var/www
	echo -e "->\033[37m install web module               \033[32m [ OK ] \033[0m"
	@/usr/bin/mkdir -p /var/record
	@/usr/bin/chown -R root:pbx /var/record
	echo -e "->\033[37m create recording directory       \033[32m [ OK ] \033[0m"
	@/usr/bin/ln -sf /usr/local/freeswitch/bin/fs_cli /usr/bin/fs_cli
	@/usr/bin/ln -sf /usr/local/freeswitch/bin/freeswitch /usr/bin/freeswitch
	echo -e "->\033[37m create freeswitch relevant links \033[32m [ OK ] \033[0m"

config:
	$(MAKE) --no-print-directory --quiet -C config

script:
	$(MAKE) --no-print-directory --quiet -C script
