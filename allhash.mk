#!/usr/bin/make -f
$(info $(MAKEFILES))
.ONESHELL:
.PHONY: help test
SHELL=bash
MAGICSTRING=GTSG33DI3PSUI3MYYOGOSUPKZAFGPSGPPRGVUXWFACNVTFZRPNHVFFUIT6BDDF5QQ66TEE5C47MO
LINESEPARATOR=----------$(MAGICSTRING)----------

help:
	#
	#

test: test.txt test.txt.allhash
	@
	cat test.txt.allhash

test.txt:
	@
	echo test.txt >$@

%.allhash: %
	@
	echo $(LINESEPARATOR) >$@
	hostname >>$@
	pwd >>$@
	echo $< >>$@
	stat $< >>$@
	date --iso-8601=seconds -r$<  >>$@
	cat $< | tee >(sha512sum) >(sha256sum) >(sha1sum) >(md5sum) | cat >>$@

