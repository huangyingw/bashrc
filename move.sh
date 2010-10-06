#!/bin/bash
RSYNCSOURCE=$1
RSYNCTARGET=$2

rsync -aH \
	"${RSYNCSOURCE}" "${RSYNCTARGET}" \
&& rsync -aH \
	"${RSYNCSOURCE}" "${RSYNCTARGET}" \
&& rm -fr "${RSYNCSOURCE}"
