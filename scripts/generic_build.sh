
#--------------------------------------------------------------------------------------------------
# This is some stupid mac shit where DYLD_LIBRARY_PATH is not passed to a protected process so 
# piggy backing off of LD_LIBRARY_PATH
#
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH


#--------------------------------------------------------------------------------------------------
#
#
key=$1 ; shift
pkg=$1 ; shift
install_dir=$1 ; shift
script_dir=$1 ; shift
build_dir=$(pwd)

#--------------------------------------------------------------------------------------------------
#
#
export PKG_CONFIG_PATH=$install_dir/lib/pkgconfig:$install_dir/lib64/pkgconfig
export PERL5LIB=$PERL5LIB:$script_dir/lib/perl

#export CFLAGS="$CFLAGS -Wl,-rpath,$install_dir/lib"  
export LDFLAGS="$LDFLAGS -Wl,-rpath,$install_dir/lib" 

if [[ "$OSTYPE" == "darwin"* ]]
then
    export CC=clang
    export CXX=clang++

else
    if [ -f $install_dir/bin/gcc ]; then
        export CC=$install_dir/bin/gcc
        export CXX=$install_dir/bin/g++
    fi
fi
echo "OMNIA: Building $key"

#--------------------------------------------------------------------------------------------------
#
#
#
if [ -f $script_dir/scripts/build_$key.sh ]; then
    echo "Executing $script_dir/scripts/build_$key.sh"
    $script_dir/scripts/build_$key.sh $key $pkg $install_dir $script_dir $@
    if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
    exit
else
    echo "Executing $script_dir/scripts/build_default.sh cound not find $script_dir/scripts/build_$key.sh"
    $script_dir/scripts/build_default.sh $key $pkg $install_dir $script_dir $@
    if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
    exit
fi
