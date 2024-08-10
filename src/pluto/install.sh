#!/bin/sh
set -e

VERSION=${VERSION:-"0.19"}
${HOME}/.juliaup/bin/julia -e "using Pkg; Pkg.add(name=\"Pluto\", version=\"$VERSION\")"

echo "Done!"