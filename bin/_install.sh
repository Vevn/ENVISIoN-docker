#!/bin/bash

# this stops the script on the first error
set -e

# ENVISIoN
echo "git clone ENVISIoN..."
if [ ! -d "ENVISIoN" ]; then
    git clone https://github.com/rartino/ENVISIoN
fi

# INVIWO
if [ ! -d "inviwo" ]; then
    echo "git clone inviwo..."
    git clone https://github.com/inviwo/inviwo.git

    echo "checking out v0.9.11..."
    cd inviwo
    git checkout v0.9.11

    echo "updating submodules..."
    git submodule update --init --recursive

    echo "applying patches..."
    git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/transferfunctionFix.patch
    git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/deb-package.patch
    git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/paneProperty2019.patch
    git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/sysmacro.patch
    git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/inviwo-v0.9.10-extlibs.patch

    cd ..
fi

echo "building inviwo..."
mkdir -p inviwo-build
cd inviwo-build

export QT_SELECT=5
cmake -G "Unix Makefiles" \
    -DCMAKE_PREFIX_PATH="/opt/Qt/5.14.1/gcc_64/lib/cmake" \
    -DCMAKE_C_COMPILER="gcc-8" \
    -DCMAKE_CXX_COMPILER="g++-8" \
    -DBUILD_SHARED_LIBS=ON \
    -DIVW_USE_EXTERNAL_HDF5:BOOL=ON \
    -DIVW_EXTERNAL_MODULES="$HOME/ENVISIoN/ENVISIoN/inviwo/modules" \
    -DIVW_MODULE_CRYSTALVISUALIZATION=ON \
    -DIVW_MODULE_FERMI=OFF \
    -DIVW_MODULE_GRAPH2D=ON \
    -DIVW_MODULE_PYTHON3=ON \
    -DIVW_MODULE_PYTHON3QT=ON \
    -DIVW_MODULE_QTWIDGETS=ON \
    -DIVW_MODULE_HDF5=ON \
    -DIVW_PACKAGE_PROJECT=ON \
    -DIVW_PACKAGE_INSTALLER=ON \
    ../inviwo

make -j5

cd ../ENVISIoN
npm install
