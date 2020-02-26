#!/bin/sh
stat $1 | grep -oE "Size: +[0-9]+" | grep -oE "[0-9]+"

