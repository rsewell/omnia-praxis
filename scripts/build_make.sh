

#--------------------------------------------------------------------------------------------------
# This is some stupid mac shit where DYLD_LIBRARY_PATH is not passed to a protected process so 
# piggy backing off of LD_LIBRARY_PATH
#
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH


key=$1 ; shift
pkg=$1 ; shift
install_dir=$1 ; shift
script_dir=$1 ; shift
build_dir=$(pwd)

echo "OMNIA: Building $key"

#------------------------------------------------------------------------------------------------------------------
# make (4.4.1)
#
echo "OMNIA: Building GNU Make"
stage.sh $key $pkg $install_dir $script_dir
pushd make-4.4.1
./configure --prefix=$install_dir $@
if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
./build.sh && ./make V=1 && ./make install
if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
popd
rm -rf *
