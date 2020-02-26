#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Usage: tail10MiB <FILE>" 1>&2
	exit 1
fi

filesize=`filesize $1`
if [ "$filesize" -le `expr 1024 \* 1024 \* 20` ]; then
	echo Error: size of the file should be greater than 20MiB 1>&2
	exit 1
fi

skipbytes=`expr $filesize - 1024 \* 1024 \* 10`
echo skipping $skipbytes bytes. 1>&2
dd if="$1" iflag=skip_bytes skip=$skipbytes

