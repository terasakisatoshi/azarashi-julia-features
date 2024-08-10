#!/bin/sh
set -e

JULIA_PACKAGES=${JULIA_PACKAGES:-"Pluto"}
python --version
# julia -e  "using Pkg; Pkg.add(\"${JULIA_PACKAGES}\")"

echo "Done!"