#!/usr/bin/make -f
.ONESHELL:
.PHONY: help test
SHELL=bash
MAGICSTRING=GTSG33DI3PSUI3MYYOGOSUPKZAFGPSGPPRGVUXWFACNVTFZRPNHVFFUIT6BDDF5QQ66TEE5C47MO
LINESEPARATOR=----------$(MAGICSTRING)----------

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA:
	# Calculate hash values of <FILE> and store them into <FILE>.allhash.
	#
	#         allhash <FILE>.allhash
	#

%.allhash: %
	@
	echo $(LINESEPARATOR) >$@
	hostname >>$@
	pwd >>$@
	echo $< >>$@
	stat $< >>$@
	date --iso-8601=seconds -r$<  >>$@
	cat $< | tee >(sha512sum >>$@) >(sha256sum >>$@) >(sha1sum >>$@) >(md5sum >>$@) >/dev/null

