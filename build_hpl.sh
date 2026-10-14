#!/bin/bash

set -e
module restore
if command -v load-epcc-module &> /dev/null; then
    load-epcc-module
fi
module load cse_env/0.2
module load PrgEnv-intel
if module is-loaded cray-libsci; then
    module unload cray-libsci
fi
module load intel-mkl
# should find if loaded correctly
which mpicc

if [ -d "src/auxil/cirrus" ]; then
    make arch=cirrus clean
else
    echo "No prior build found. Skipping clean step."
fi
make arch=cirrus


