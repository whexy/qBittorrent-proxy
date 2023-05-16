# Build the dependencies
cd libtorrent
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=14 -G Ninja ..
ninja

# Build the project
cd ../../
./configure
make -j16
make install

# Make sure the libraries are found
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib