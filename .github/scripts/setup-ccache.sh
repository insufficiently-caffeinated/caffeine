#!/usr/bin/env bash

basedir=$GITHUB_WORKSPACE

{
  echo "CCACHE_BASEDIR=$basedir"
  echo "CCACHE_DIR=$basedir/.ccache"
  echo "CCACHE_COMPRESS=true"
  echo "CCACHE_COMPRESSLEVEL=6"
  echo "CCACHE_MAXSIZE=400M"
} >> $GITHUB_ENV
