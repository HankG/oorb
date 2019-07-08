#!/bin/bash
cd cmake-build-debug
rm -f pyoorb*.so
rm -f ../python/pyoorb*.so
f2py --quiet -m pyoorb ../python/pyoorb.f90 --overwrite-signature -h ../build/pyoorb.pyf.tmp
../build-tools/generate-version-pyf.sh $(cat ../VERSION) > ../build/version.pyf
sed '/    interface  ! in :pyoorb/ r ../build/version.pyf' ../build/pyoorb.pyf.tmp > ../build/pyoorb.pyf.tmp2

mv ../build/pyoorb.pyf.tmp2 ../build/pyoorb.pyf
rm -f ../build/pyoorb.pyf.tmp ../build/version.pyf
mkdir ../build/_pyoorb_build
f2py -m pyoorb CMakeFiles/oorblib.dir/python/pyoorb.f90.o ../build/pyoorb.pyf libliboorb.a --build-dir _pyoorb_build -c --noarch --fcompiler=gnu95 --f90exec=gfortran --f90flags="-I ../build -g -O0 -fPIC -fbounds-check -pedantic -Wall -std=f95 -fall-intrinsics -cpp"

cp pyoorb*.so ../python
