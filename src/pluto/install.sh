#!/bin/sh
set -e

VERSION=${VERSION:-"0.19"}
USERNAME=${USERNAME:-${_REMOTE_USER:-"automatic"}}

if [ "${USERNAME}" = "root" ]; then
    /root/.juliaup/bin/julia -e "using Pkg; Pkg.add(name=\"Pluto\", version=\"$VERSION\")"
else
    /home/${USERNAME}/.juliaup/bin/julia -e "using Pkg; Pkg.add(name=\"Pluto\", version=\"$VERSION\")"
fi

echo "Done!"