#!/bin/bash
echo "git clone ENVISIoN..."
if [ ! -d "ENVISIoN" ]; then
    git clone https://github.com/rartino/ENVISIoN
else
    echo "ENVISIoN already exists, skipping clone"
fi

if [ ! -d "inviwo" ]; then
    echo "git clone inviwo"
    git clone https://github.com/inviwo/inviwo.git
else
    echo "Inviwo already exists, skipping clone"
fi

echo "checking out v0.9.10..."
cd inviwo
git checkout v0.9.10

echo "updating submodules..."
git submodule update --init --recursive
cd ..

echo "applying patches..."
git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/transferfunctionFix.patch
git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/deb-package.patch
git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/paneProperty2019.patch
git apply ~/ENVISIoN/ENVISIoN/inviwo/patches/2019/sysmacro.patch


echo "building inviwo"
mkdir -p inviwo-build
cd inviwo-build

cmake -G "Unix Makefiles" \
    -DCMAKE_PREFIX_PATH="$QTTOOLDIR/.." \
    -DCMAKE_C_COMPILER="gcc-8" \
    -DCMAKE_CXX_COMPILER="g++-8" \
    -DIVW_HDF5_USE_EXTERNAL:BOOL=ON \
    -DIVW_IMG_USE_EXTERNAL:BOOL=ON \
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
