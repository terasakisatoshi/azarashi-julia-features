#!/usr/bin/env bash
set -e

JULIAPACKAGES=${JULIAPACKAGES:-""}
USERNAME=${USERNAME:-${_REMOTE_USER:-"automatic"}}

if [ "${USERNAME}" = "root" ]; then
    JULIA_PATH=/root/.juliaup/bin/julia
else
    JULIA_PATH=/home/${USERNAME}/.juliaup/bin/julia
fi

echo "Store JULIAPAKCAGES in /usr/local/azarashi-julia-features/JULIAPACKAGES"
SCRIPT_DIR=/usr/local/azarashi-julia-features
mkdir -p "${SCRIPT_DIR}"
echo ${JULIAPACKAGES} > "${SCRIPT_DIR}/JULIAPACKAGES"

# Copy postcreate.jl into the container
echo "Copying postcreate.jl into the container..."
cp postcreate.jl "${SCRIPT_DIR}/"

${JULIA_PATH} "${SCRIPT_DIR}/postcreate.jl"

${JULIA_PATH} -E 'using Pkg; Pkg.status()'
echo "Done!"
