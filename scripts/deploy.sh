

#--------------------------------------------------------------------------------------------------
#
#
key=$1 ; shift
pkg=$1 ; shift
install_dir=$1 ; shift
script_dir=$1 ; shift
source_code=$1
build_dir=$(pwd)

#--------------------------------------------------------------------------------------------------
#
#
cd $source_code/..    
pwd
tar cf - $pkg | ( cd $build_dir ; tar xfv -)

