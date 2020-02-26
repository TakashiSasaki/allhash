.ONESHELL:
.PHONY: install testfiles help

help:
	#
	# make install
	# make testfiles
	# make test
install:
	ln -sf `readlink -f filesize.sh` /usr/local/bin/filesize

testfiles: 20MiB.bin 20MiB+1.bin

20MiB.bin:
	dd if=/dev/zero bs=1024 count=20480 of=$@

20MiB+1.bin:
	dd if=/dev/zero iflag=count_bytes count=`expr 1024 \* 1024 \* 20 + 1` of=$@

test:
	./tail10MiB.sh 20MiB+1.bin | wc -c
