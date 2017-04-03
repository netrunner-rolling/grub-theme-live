Version=17.0.1

PREFIX = /usr/local

THEME = \
	$(wildcard netrunner-live/*.png) \
	netrunner-live/theme.txt \
	netrunner-live/u_vga16_16.pf2

ICONS= $(wildcard netrunner-live/icons/*.png)

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
