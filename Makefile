.PHONY: install help default uninstall crw-base64 crw-bash

CMD := ruce-wrapper

DESTDIR ?= /
PREFIX ?= /usr
INSTALL_BIN ?= $(PREFIX)/bin
INSTALL_BASH_LIB ?= $(PREFIX)/lib/bash
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
	

install: crw-base64
	install -m755 ruce-wrapper $(INSTALL_BIN)
	install -m755 crw-base64 $(INSTALL_BIN)

crw-base64:
	$(CC) $(CFLAGS) convert.c -o crw-base64

# Uses crw-base64() in bash
crw-bash:
	install -m755 ruce-wrapper $(INSTALL_BIN)
	install -m755 crw-b64.sh $(INSTALL_BASH_LIB)
	
uninstall:
	rm -rf $(INSTALL_BIN)/ruce-wrapper
	rm -rf $(INSTALL_BIN)/crw-base64
