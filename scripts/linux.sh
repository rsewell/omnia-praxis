#--------------------------------------------------------------------------------------------------
#
#
if [[ "$OSTYPE" != "darwin"* ]]
then
    $@
else
    echo "Skipping build of $2 for Darwin Platform"
    touch $install_dir/.build/$2
fi

