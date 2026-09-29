
ulimit -S -n 4096

export BASH_SILENCE_DEPRECATION_WARNING=1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#export OMNIA_HOME=$(readlink -f $SCRIPT_DIR/..)

if [[ "$OSTYPE" == "darwin"* ]]
then
    export OMNIA_HOME=/Users/Shared/.omnia
else
    if test -f /data/.omnia/bin/profile.sh; then
        export OMNIA_HOME=/data/.omnia
    else
        if test -f /opt/omnia/bin/profile.sh; then
            export OMNIA_HOME=/opt/omnia
        else
            export OMNIA_HOME=~/.omnia
        fi
    fi
fi

#export CARGO_HOME=$OMNIA_HOME/.cargo
#export M2_HOME=$OMNIA_HOME/.m2
#export TEST_TMPDIR=$OMNIA_HOME/.cache


#tar --no-mac-metadata --no-xattrs
#ulimit -c unlimited

umask 022

set +h

export LC_ALL=POSIX

export CLICOLOR=1

alias ls="ls -G --color=auto"
alias ll="ls -Glah --color=auto"
alias unlock="find . -flags uchg -print -exec chflags nouchg {} \;"
alias esync="rsync -a --progress --partial --no-perms"

export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
export PS2='> '
export PS4='+  '

export PATH="$PATH:/usr/sbin"
export PATH="/usr/local/bin:$PATH"
export PATH="$OMNIA_HOME/bin:$PATH"
export PATH="$SCRIPT_DIR:$PATH"

export PERL5LIB=$PERL5LIB:$OMNIA_HOME/lib/perl5/5.40/site_perl/:$OMNIA_HOME/lib/perl

export XDG_DATA_HOME=$OMNIA_HOME/share
export XDG_DATA_DIRS=$OMNIA_HOME/share

export CARGO_HOME=$OMNIA_HOME/.cargo

#----------------------------------------------------------------------------------------------------------------------
# Setup the TCL Library PATH to point to the OMNIA Home/lib/tcl directory

#if [ -z ${TCLLIBPATH+x} ]; then
#    export TCLLIBPATH="$OMNIA_HOME/lib $(readlink $SCRIPT_DIR)/../lib/tcl"
#else
#    export TCLLIBPATH="$OMNIA_HOME/lib $(readlink $SCRIPT_DIR)/../lib/tcl $TCLLIBPATH"
#fi


if [[ "$OSTYPE" == "darwin"* ]]
then    
    export TARGET "__DARWIN__"
    if [[ $(uname -m) == x86_64 ]]; then
        echo "Setting Omnia up for OSX X86"
    else 
        echo "Setting Omnia up for OSX ARM"
    fi

    export PATH=/Library/PostgreSQL/16/bin:$PATH

    alias beep="afplay /System/Library/Sounds/Submarine.aiff -v 10"

    export PATH="/opt/homebrew/bin:$PATH"

    if [ -z ${DYLD_LIBRARY_PATH+x} ]; then
        export DYLD_LIBRARY_PATH=$OMNIA_HOME/lib:$OMNIA_HOME/lib64
    else
        export DYLD_LIBRARY_PATH=$OMNIA_HOME/lib:$OMNIA_HOME/lib64:$DYLD_LIBRARY_PATH
    fi
else
    export TARGET "__LINUX__"
#    if [[ $(uname -m) == x86_64 ]]; then
#        echo "Setting up for Linux X86"
#    else 
#        echo "Setting up for Linux ARM"
#    fi

    if [ -z ${LD_LIBRARY_PATH+x} ]; then
        export LD_LIBRARY_PATH=$OMNIA_HOME/lib:$OMNIA_HOME/lib64
    else
        export LD_LIBRARY_PATH=$OMNIA_HOME/lib:$OMNIA_HOME/lib64:$LD_LIBRARY_PATH
    fi
fi

if [ -z ${LC_RPATH+x} ]; then
    export LC_RPATH=$DYLD_LIBRARY_PATH
else
    export LC_RPATH=$DYLD_LIBRARY_PATH:$LC_RPATH
fi

export LDFLAGS="-L$OMNIA_HOME/lib -L$OMNIA_HOME/lib64"
export CPPFLAGS="-I$OMNIA_HOME/include"
export CFLAGS="-O3 -I$OMNIA_HOME/include -I$OMNIA_HOME/include/ncursesw"

#--------------------------------------------------------------------------------------------------
# Strip Path and Extension from a file name
#
path_to_name () {
    y=${1%.git}
    z=${y##*/}
    echo $z
}

#find ./someDir -name "*.php" -o -name "*.html" | tar -cf my_archive -T -
#find . -name "sysexits.h" -exec bash -c 'wc "$0"; file "$0"' {} \;
#git fetch -p origin ; git push --mirror

#rm -rfv omnia-tesseract ; git init --separate-git-dir omnia-tesseract-staging omnia-tesseract ; cd omnia-tesseract ; git checkout .


logit() {
    current_time=$(date "+%Y-%m-%d-(%H-%M-%S)")
    new_fileName=log.$current_time

    $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 >$new_fileName 2>&1 &
    tail -f $new_fileName
}


#--------------------------------------------------------------------------------------------------
# Mark a repository to be skipped, by the pull process - delete an existing instance of the 
#   repository
#
skipgit () {
    if [ "$1x" == "x" ]; 
    then
    	echo "No git repository specified"
    else
    	for VAR in "$@"
    	do
    		current_path=$(pwd)
    		dest_path=${VAR%/*}
    		if [ "$dest_path" != "$VAR" ]; 
    		then
    		    cd "$dest_path"
    		fi
    		mkdir -p .skip
    		du -hs $(basename $VAR)
    		rm -rf $(basename $VAR)
    		touch .skip/$(path_to_name $VAR)

    		if [ "$dest_path" != "$VAR" ]; 
    		then
    		    cd "$current_path"
    		fi
    		echo "Skip set for $VAR"
    	done
    fi
}

#--------------------------------------------------------------------------------------------------
# 
#
mirrorgit () {
    unset DYLD_LIBRARY_PATH
    mkdir .done
    mkdir .error
    target_group=$1
    shift
    for VAR in "$@"
    do
        echo $VAR
        target=$(path_to_name $VAR)
        echo "Processing $target --> $target_group"
        cd -- $target.git
        if ! git push --mirror git@git.tebisllp.com:$target_group/$target.git
        then
            cd ..
            echo "ERROR IN $target.git"
            mv -v $target.git .error/. 
            return 1
        fi
        cd ..
        mv $target.git .done/.
    done
}

#--------------------------------------------------------------------------------------------------
# 
#
copygit () {
    if [ "$1" == "--full" ]; 
    then
	vfull="--full"
	shift
    else
	vfull="--sparse"
	shift
    fi

    for VAR in "$@"
    do
        mkdir $(basename $VAR) 
        cd $(basename $VAR)
        tclsh $HOME/.bin/github-clone.tcl $vfull $(basename $VAR) > do.sh 
        . ./do.sh
        rm do.sh
        rm data.json
        ls | wc
        cd ..
    done
}


#--------------------------------------------------------------------------------------------------
# 
#
open_file_counts() {
    lsof | awk '{print $1}' | sort | uniq -c | sort -rn | head
}

#--------------------------------------------------------------------------------------------------
# 
#
boot_docker () {

    docker container run --privileged --rm --net host -e DISPLAY=$DISPLAY -v epilogue-praxis:/home/rsewell -v /Volumes/Vault:/home/rsewell/Archives -v /Volumes/Vault/Projects:/home/rsewell/Projects -it --name praxis --user rsewell rsewell/praxis-v3

    rsync -a --progress --delete robert.sewell@192.168.200.91:Projects/epilogue-praxis Projects/ ; ~/Projects/epilogue-praxis/build.sh
}

#--------------------------------------------------------------------------------------------------
# 
#
cleanup () {
    find . -name '.DS_Store' -print -delete 
    find . -type d -empty -print -delete
}

#--------------------------------------------------------------------------------------------------
# 
#
afscompress () {
    afsctool -v -c -j8 -9 $1
}

#--------------------------------------------------------------------------------------------------
# 
#
dirsize () {
    for VAR in "$@"
    do
        du -hs $VAR
    done
#    find $1 -maxdepth 1 -mindepth 1 -type d -exec du -hs {} \;
}

#--------------------------------------------------------------------------------------------------
# 
#
filecount () {
    for VAR in "$@"
    do
        count=$(find $VAR | wc -l)
        echo $(printf '%+9s' $count) files under $VAR
    done
#    find $1 -maxdepth 1 -mindepth 1 -type d -exec du -hs {} \;
}

find_broken_links () {
    find $1 -type l ! -exec [ -e {} ] \; -print
}

#--------------------------------------------------------------------------------------------------
#
#
pushdir () {
    command pushd "$@" > /dev/null
}

#--------------------------------------------------------------------------------------------------
#
#
popdir () {
    command popd "$@" > /dev/null
}

#--------------------------------------------------------------------------------------------------
# 
#
push_to_fiserv () {
    pushd ~/Projects
    rsync -a -t --delete --no-perms --progress --partial --delete --compress . rsewell@mydev:Projects/
    popd
}

#--------------------------------------------------------------------------------------------------
# 
#
pull_from_fiserv () {
    pushd ~/Projects
    rsync -a -t --delete --no-perms --progress --partial --delete --compress rsewell@mydev:Projects/ .
    popd
}


#--------------------------------------------------------------------------------------------------
# 
#
mydev () {
    ssh rsewell@mydev
}

#--------------------------------------------------------------------------------------------------
# 
#
push_to_local () {
    pushd ~/Projects
    rsync -a --delete --no-perms --progress --partial --delete  . rsewell@linux-1:Projects/
    popd
}

#--------------------------------------------------------------------------------------------------
# 
#
pull_from_local () {
    pushd ~/Projects
    rsync -a --delete --no-perms --progress --partial --delete rsewell@linux-1:Projects/ .
    popd
}


export PATH=$OMNIA_HOME/bin:$PATH

#--------------------------------------------------------------------------------------------------
# Load the katana configuration
#
#. ~/Projects/katana-platform/bin/profile.sh


export PATH=.:$PATH
#
#
#
#
#--------------------------------------------------------------------------------------------------
#
if [[ "$OSTYPE" == "darwin"* ]] ; then
    eval $(dircolors)
#else
#    eval $(gdircolors)
fi

#--------------------------------------------------------------------------------------------------
# 
#
backup () {
    current_time=$(date "+%Y-%m-%d-(%H-%M-%S)")
    new_fileName=$1.$current_time.tar.gz
    echo "Backing up $1 to $new_fileName"
    tar -cvzf $new_fileName $1
}

#--------------------------------------------------------------------------------------------------
# 
#
mark_empty_dirs () {
    find . -mindepth 1 -type d -not -path "./.git/*" -empty -print -exec touch {}/.keep \;
}

#--------------------------------------------------------------------------------------------------
# 
#
sync_all ( ) {
    pushd ~/Projects
    echo "Looking for and removing OS garbage files ..."
    find . -name '.DS_Store' -print -delete
    for d in */ ; do
        echo "$d"
            if test -d $d/.git; then
                pushd "$d"
                git status
                popd        
            fi
    done
    popd
}

#--------------------------------------------------------------------------------------------------
# 
#
refresh_github( ) {
    pushd %1
    git pull
    popd
}

#--------------------------------------------------------------------------------------------------
# 
#
git_sync ( ) {
    if test -d .git; then
        echo "Commiting $1"
        rm -rf build
        mark_empty_dirs
        git add . ; git commit -m "$1" ; git push
    else
        echo "Not in a git root directory - nothing to do..."
    fi
}


#echo "Omnia development profile 1.0 loaded."

#
#
#
#--------------------------------------------------------------------------------------------------
# Load the katana configuration
#
#. ~/Projects/katana-platform/bin/profile.sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PATH=$SCRIPT_DIR:$PATH

#--------------------------------------------------------------------------------------------------
# Git (GitHub) seems to have no end of problems with large repositories with out this
#
# git config http.postBuffer 524288000

#--------------------------------------------------------------------------------------------------
# Fixes an issue with some Linux setups with Bash
#
export TERMINFO=/usr/share/terminfo
