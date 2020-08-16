#!/usr/bin/bash
#
# {{{ CDDL HEADER
#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
# }}}

# Copyright 2020 OmniOS Community Edition (OmniOSce) Association.

. ../../lib/functions.sh

PROG=protobuf
VER=3.12.4
PKG=ooce/library/protobuf
SUMMARY="protobuf"
DESC="Google's language-neutral, platform-neutral, extensible mechanism "
DESC+="for serializing structured data"

XFORM_ARGS="-DPREFIX=${PREFIX#/}"

CONFIGURE_OPTS="
    --prefix=$PREFIX
"
CONFIGURE_OPTS_32="
    --bindir=$PREFIX/bin/$ISAPART
    --disable-64bit-solaris
"
CONFIGURE_OPTS_64="
    --bindir=$PREFIX/bin
"

init
download_source $PROG $PROG-cpp $VER
prep_build
patch_source
build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
