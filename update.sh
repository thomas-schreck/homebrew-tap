#!/bin/sh
# Called by the hexwerk release workflow: update.sh <version> <zip-sha256> <cli-sha256>
set -eu
v=$1 zip=$2 cli=$3
sed -i.bak -E "s/^  version \".*\"/  version \"$v\"/; s/^  sha256 \".*\"/  sha256 \"$zip\"/" Casks/hexwerk.rb
sed -i.bak -E "s/^  version \".*\"/  version \"$v\"/; s/^  sha256 \".*\"/  sha256 \"$cli\"/; s#/download/v[^/]*/hexwerk-cli-[^\"]*\.tar\.gz#/download/v$v/hexwerk-cli-$v-arm64.tar.gz#" Formula/hexwerk.rb
rm -f Casks/hexwerk.rb.bak Formula/hexwerk.rb.bak
