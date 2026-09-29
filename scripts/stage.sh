
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
echo $pkg
find $script_dir/components -maxdepth 2 -type d -name $pkg -print -exec $script_dir/scripts/deploy.sh $key $pkg $install_dir $script_dir {} \;
if [ ! -d $build_dir/$pkg ]; then
    find $script_dir/components -maxdepth 2 -name $pkg.tar.gz -print -exec tar -xvf {} \;
    if [ ! -d $build_dir/$pkg ]; then
        pushd $script_dir/modules    
        tar cf - $pkg | ( cd $build_dir ; tar xfv -)
        if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
        popd
    fi
fi
