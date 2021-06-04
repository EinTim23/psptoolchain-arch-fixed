EXPAT_VERSION=2.3.0

download_and_extract "http://sourceforge.net/projects/expat/files/expat/2.3.0/expat-2.3.0-RENAMED-VULNERABLE-PLEASE-USE-2.4.1-INSTEAD.tar.gz"  expat-$EXPAT_VERSION
## Patch
cp ../../patches/config.sub ./config.sub
cp ../../patches/config.sub ./conftools/config.sub
run_configure
run_make

