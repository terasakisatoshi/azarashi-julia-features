#!/bin/sh
set -e

VERSION=${VERSION:-"0.19"}
USERNAME=${USERNAME:-${_REMOTE_USER:-"automatic"}}

if [ "${USERNAME}" = "root" ]; then
    JULIA_PATH=/root/.juliaup/bin/julia
else
    JULIA_PATH=/home/${USERNAME}/.juliaup/bin/julia
fi

echo "Installing Pluto.jl version $VERSION... using ${JULIA_PATH}"
${JULIA_PATH} -e "using Pkg; Pkg.add(name=\"Pluto\", version=\"$VERSION\")"

echo "Done!"