# Copyright (c) 2019 William Pitcock <nenolod@dereferenced.org>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# This software is provided 'as is' and without any warranty, express or
# implied.  In no event shall the authors be liable for any damages arising
# from the use of this software.

# pkgconf-lite is a staticly-linked version of pkgconf that does not include
# all features, notably it does not include cross-compile support and MSVC
# support.  It does not include the libpkgconf library.

# modified Makefile.lite for PSPDEV, by carstene1ns 2020

SRCS = \
	libpkgconf/argvsplit.c		\
	libpkgconf/audit.c		\
	libpkgconf/bsdstubs.c		\
	libpkgconf/cache.c		\
	libpkgconf/client.c		\
	libpkgconf/dependency.c		\
	libpkgconf/fileio.c		\
	libpkgconf/fragment.c		\
	libpkgconf/parser.c		\
	libpkgconf/path.c		\
	libpkgconf/personality.c	\
	libpkgconf/pkg.c		\
	libpkgconf/queue.c		\
	libpkgconf/tuple.c		\
	cli/getopt_long.c		\
	cli/main.c
OBJS = ${SRCS:.c=.o}
CFLAGS = ${STATIC} -DPKGCONF_LITE -I. -Ilibpkgconf -Icli -DSYSTEM_LIBDIR=\"${SYSTEM_LIBDIR}\" -DSYSTEM_INCLUDEDIR=\"${SYSTEM_INCLUDEDIR}\" -DPKG_DEFAULT_PATH=\"${PKG_DEFAULT_PATH}\"
STATIC =
STRIP = strip

# pspdev: sane defaults
SYSTEM_LIBDIR=${PSPDEV}/psp/lib
SYSTEM_INCLUDEDIR=${PSPDEV}/psp/include
PKG_DEFAULT_PATH=${PSPDEV}/psp/lib/pkgconfig

all: psp-pkg-config

libpkgconf/config.h:
	@echo '#define PACKAGE_NAME "psp-pkgconf"' >> $@
	@echo '#define PACKAGE_BUGREPORT "https://github.com/pspdev/psp-pkgconf/issues"' >> $@
	@echo '#define PACKAGE_VERSION "1.7.3"' >> $@
	@echo '#define PACKAGE PACKAGE_NAME " " PACKAGE_VERSION' >> $@

.c.o:
	@echo "CC   $<"
	@$(CC) $(CFLAGS) -c $< -o $@

psp-pkg-config: libpkgconf/config.h ${OBJS}
	@echo "CCLD $@"
	@${CC} ${STATIC} -o $@ ${OBJS}
	@${STRIP} $@

install: psp-pkg-config
	mkdir -p ${DESTDIR}${PSPDEV}/bin
	install -m755 psp-pkg-config ${DESTDIR}${PSPDEV}/bin
	mkdir -p ${DESTDIR}${PSPDEV}/psp/share/aclocal
	install -m644 pkg.m4 ${DESTDIR}${PSPDEV}/psp/share/aclocal

uninstall:
	@test -e ${DESTDIR}${PSPDEV}/bin/psp-pkg-config && \
		rm -vf ${DESTDIR}${PSPDEV}/bin/psp-pkg-config
	@test -e ${DESTDIR}${PSPDEV}/psp/share/aclocal/pkg.m4 && \
		rm -vf ${DESTDIR}${PSPDEV}/psp/share/aclocal/pkg.m4

clean:
	rm -f libpkgconf/config.h
	rm -f ${OBJS}
	rm -f psp-pkg-config

.PHONY: clean install uninstall
