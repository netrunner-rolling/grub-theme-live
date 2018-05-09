Version=17.1.1

PREFIX = /usr/local

CFG = $(wildcard cfg/*.cfg)

THEME = \
	$(wildcard netrunner-live/*.png) \
	netrunner-live/theme.txt \
	netrunner-live/*.pf2

ICONS= $(wildcard netrunner-live/icons/*.png)

TZ = $(wildcard tz/*)

LOCALES = $(wildcard locales/*)

install:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/grub/themes/netrunner-live
	install -m0644 ${THEME} $(DESTDIR)$(PREFIX)/share/grub/themes/netrunner-live

	install -dm0755 $(DESTDIR)$(PREFIX)/share/grub/themes/netrunner-live/icons
	install -m0644 ${ICONS} $(DESTDIR)$(PREFIX)/share/grub/themes/netrunner-live/icons

uninstall:
	for f in ${THEME}; do rm -f $(DESTDIR)$(PREFIX)/share/grub/theme/netrunner-live/$$f; done
	for f in ${ICONS}; do rm -f $(DESTDIR)$(PREFIX)/share/grub/theme/netrunner-live/icons/$$f; done

dist:
	git archive --format=tar --prefix=grub-theme-$(Version)/ $(Version) | gzip -9 > grub-theme-$(Version).tar.gz
	gpg --detach-sign --use-agent grub-theme-$(Version).tar.gz

.PHONY: install uninstall dist
