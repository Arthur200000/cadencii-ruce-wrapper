.PHONY: default help test \
install install-lib

CMD := ruce-wrapper

DESTDIR ?= /
PREFIX ?= /usr
INSTALL_BIN ?= $(PREFIX)/bin
INSTALL_MAN ?= $(PREFIX)/share/man/man1

CC ?= cc
CFLAGS ?= -O3

default: help

help:
	@echo 'Makefile rules:'
	@echo ''
	@echo 'install Install $(CMD)'
	@echo 'uninstall Uninstall $(CMD)'
	@echo 'clean Remove build/test files'
	@echo ''
	@echo 'This script supports DESTDIR for installation.'
	
# test: NO TEST PROVIDED

install: crw-base64
	install -m755 ruce-wrapper $(INSTALL_BIN)
	install -m755 crw-base64 $(INSTALL_BIN)

crw-base64:
	$(CC) $(CFLAGS) convert.c -o crw-base64

uninstall:
	rm -rf $(INSTALL_BIN)/ruce-wrapper
	rm -rf $(INSTALL_BIN)/crw-base64
