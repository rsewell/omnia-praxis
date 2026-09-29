#----------------------------------------------------------------------------------------------------------------------
# Base everything in the environment from the directory from hwihc this file is being run 
#   should be the root/katana/bin directory
#
ulimit -n 12000

#--------------------------------------------------------------------------------------------------
# CMAKE Environment Variables
#
#   CMAKE_GENERATOR 
#   CMAKE_GENERATOR_TOOLSET
#   CMAKE_GENERATOR_PLATFORM
#   CMAKE_BUILD_PARALLEL_LEVEL
#   CMAKE_VERBOSE_MAKEFILE
#


# Usage
#
#  cmake [options] <path-to-source>
#  cmake [options] <path-to-existing-build>
#  cmake [options] -S <path-to-source> -B <path-to-build>
#
# Specify a source directory to (re-)generate a build system for it in the
# current working directory.  Specify an existing build directory to
# re-generate its build system.
#
# Options
#  -S <path-to-source>          = Explicitly specify a source directory.
#  -B <path-to-build>           = Explicitly specify a build directory.
#  -C <initial-cache>           = Pre-load a script to populate the cache.
#  -D <var>[:<type>]=<value>    = Create or update a cmake cache entry.
#  -U <globbing_expr>           = Remove matching entries from CMake cache.
#  -G <generator-name>          = Specify a build system generator.
#  -T <toolset-name>            = Specify toolset name if supported by
#                                 generator.
#  -A <platform-name>           = Specify platform name if supported by
#                                 generator.
#  --toolchain <file>           = Specify toolchain file
#                                 [CMAKE_TOOLCHAIN_FILE].
#  --install-prefix <directory> = Specify install directory
#                                 [CMAKE_INSTALL_PREFIX].
#  -Wdev                        = Enable developer warnings.
#  -Wno-dev                     = Suppress developer warnings.
#  -Werror=dev                  = Make developer warnings errors.
#  -Wno-error=dev               = Make developer warnings not errors.
#  -Wdeprecated                 = Enable deprecation warnings.
#  -Wno-deprecated              = Suppress deprecation warnings.
#  -Werror=deprecated           = Make deprecated macro and function warnings
#                                 errors.
#  -Wno-error=deprecated        = Make deprecated macro and function warnings
#                                 not errors.
#  --preset <preset>,--preset=<preset>
#                               = Specify a configure preset.
#  --list-presets[=<type>]      = List available presets.
#  --workflow [<options>]       = Run a workflow preset.
#  -E                           = CMake command mode.  Run "cmake -E" for a
#                                 summary of commands.
#  -L[A][H]                     = List non-advanced cached variables.
#  -LR[A][H] <regex>            = Show cached variables that match the regex.
#  --fresh                      = Configure a fresh build tree, removing any
#                                 existing cache file.
#  --build <dir>                = Build a CMake-generated project binary tree.
#                                 Run "cmake --build" to see compatible
#                                 options and a quick help.
#  --install <dir>              = Install a CMake-generated project binary
#                                 tree.  Run "cmake --install" to see
#                                 compatible options and a quick help.
#  --open <dir>                 = Open generated project in the associated
#                                 application.
#  -N                           = View mode only.
#  -P <file>                    = Process script mode.
#  --find-package               = Legacy pkg-config like mode.  Do not use.
#  --graphviz=<file>            = Generate graphviz of dependencies, see
#                                 CMakeGraphVizOptions.cmake for more.
#  --system-information [file]  = Dump information about this system.
#  --print-config-dir           = Print CMake config directory for user-wide
#                                 FileAPI queries.
#  --log-level=<ERROR|WARNING|NOTICE|STATUS|VERBOSE|DEBUG|TRACE>
#                               = Set the verbosity of messages from CMake
#                                 files.  --loglevel is also accepted for
#                                 backward compatibility reasons.
#  --log-context                = Prepend log messages with context, if given
#  --debug-trycompile           = Do not delete the try_compile build tree.
#                                 Only useful on one try_compile at a time.
#  --debug-output               = Put cmake in a debug mode.
#  --debug-find                 = Put cmake find in a debug mode.
#  --debug-find-pkg=<pkg-name>[,...]
#                               = Limit cmake debug-find to the
#                                 comma-separated list of packages
#  --debug-find-var=<var-name>[,...]
#                               = Limit cmake debug-find to the
#                                 comma-separated list of result variables
#  --trace                      = Put cmake in trace mode.
#  --trace-expand               = Put cmake in trace mode with variable
#                                 expansion.
#  --trace-format=<human|json-v1>
#                               = Set the output format of the trace.
#  --trace-source=<file>        = Trace only this CMake file/module.  Multiple
#                                 options allowed.
#  --trace-redirect=<file>      = Redirect trace output to a file instead of
#                                 stderr.
#  --warn-uninitialized         = Warn about uninitialized values.
#  --no-warn-unused-cli         = Don't warn about command line options.
#  --check-system-vars          = Find problems with variable usage in system
#                                 files.
#  --compile-no-warning-as-error= Ignore COMPILE_WARNING_AS_ERROR property and
#                                 CMAKE_COMPILE_WARNING_AS_ERROR variable.
#  --profiling-format=<fmt>     = Output data for profiling CMake scripts.
#                                 Supported formats: google-trace
#  --profiling-output=<file>    = Select an output path for the profiling data
#                                 enabled through --profiling-format.
#  -h,-H,--help,-help,-usage,/? = Print usage information and exit.
#  --version,-version,/V [<file>]
#                               = Print version number and exit.
#  --help <keyword> [<file>]    = Print help for one keyword and exit.
#  --help-full [<file>]         = Print all help manuals and exit.
#  --help-manual <man> [<file>] = Print one help manual and exit.
#  --help-manual-list [<file>]  = List help manuals available and exit.
#  --help-command <cmd> [<file>]= Print help for one command and exit.
#  --help-command-list [<file>] = List commands with help available and exit.
#  --help-commands [<file>]     = Print cmake-commands manual and exit.
#  --help-module <mod> [<file>] = Print help for one module and exit.
#  --help-module-list [<file>]  = List modules with help available and exit.
#  --help-modules [<file>]      = Print cmake-modules manual and exit.
#  --help-policy <cmp> [<file>] = Print help for one policy and exit.
#  --help-policy-list [<file>]  = List policies with help available and exit.
#  --help-policies [<file>]     = Print cmake-policies manual and exit.
#  --help-property <prop> [<file>]
#                               = Print help for one property and exit.
#  --help-property-list [<file>]= List properties with help available and
#                                 exit.
#  --help-properties [<file>]   = Print cmake-properties manual and exit.
#  --help-variable var [<file>] = Print help for one variable and exit.
#  --help-variable-list [<file>]= List variables with help available and exit.
#  --help-variables [<file>]    = Print cmake-variables manual and exit.
#
#Generators
#
#The following generators are available on this platform (* marks default):
#  Green Hills MULTI            = Generates Green Hills MULTI files
#                                 (experimental, work-in-progress).
#* Unix Makefiles               = Generates standard UNIX makefiles.
#  Ninja                        = Generates build.ninja files.
#  Ninja Multi-Config           = Generates build-<Config>.ninja files.
#  Watcom WMake                 = Generates Watcom WMake makefiles.
#  CodeBlocks - Ninja           = Generates CodeBlocks project files
#                                 (deprecated).
#  CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files
#                                 (deprecated).
#  CodeLite - Ninja             = Generates CodeLite project files
#                                 (deprecated).
#  CodeLite - Unix Makefiles    = Generates CodeLite project files
#                                 (deprecated).
#  Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files
#                                 (deprecated).
#  Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files
#                                 (deprecated).
#  Kate - Ninja                 = Generates Kate project files (deprecated).
#  Kate - Ninja Multi-Config    = Generates Kate project files (deprecated).
#  Kate - Unix Makefiles        = Generates Kate project files (deprecated).
#  Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files
#                                 (deprecated).
#  Sublime Text 2 - Unix Makefiles
#                               = Generates Sublime Text 2 project files
#                                 (deprecated).



#--------------------------------------------------------------------------------------------------
# CMAKE Variables
#
#   CMAKE_BUILD_TYPE=Debug, Release, MinSizeRel, or RelWithDebInfo
#   CMAKE_MESSAGE_LOG_LEVEL=ERROR, WARNING, NOTICE, STATUS, VERBOSE, DEBUG, or TRACE.
#

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#--------------------------------------------------------------------------------------------------
#
#
pushd () {
    command pushd "$@" > /dev/null
}

#--------------------------------------------------------------------------------------------------
#
#
popd () {
    command popd "$@" > /dev/null
}

current_time=$(date "+%Y-%m-%d-%H-%M-%S")

#----------------------------------------------------------------------------------------------------------------------
# Set default install prefix with command line overrirde
#


if [[ "$OSTYPE" == "darwin"* ]]
then
    install_dir=/Users/Shared/.omnia

else
    mkdir -p /opt/omnia > /dev/null 2>&1
    if test -d /opt/omnia; then
        install_dir=/opt/omnia
    else
        mkdir -p /data/.omnia > /dev/null 2>&1
        if test -d /data/.omnia; then
            install_dir=/data/.omnia
        else 
            mkdir -p $HOME/.omnia
            if test -d $HOME/.omnia; then
                install_dir=~/.omnia
            fi
        fi
    fi
fi
if [ ! -z ${1+x} ]; then    
    install_dir=$1
fi

echo "target directory -> $install_dir"

export PATH=$script_dir/scripts:$PATH

if test -f $script_dir/bin/python3 ; then
    mv $script_dir/bin/python3 $script_dir/bin/python3-stub
fi

#----------------------------------------------------------------------------------------------------------------------
# If this is a clean system, need to load the environment profile from the source directories.  Otherwise assume
# the installed profile was loaded from the bashrc/bashprofile
#


if [[ -z ${OMNIA_HOME+x} ]]; then
    if ! test -f $install_dir/bin/profile.sh; then
        echo "Loading $script_dir/bin/epilogue_profile.sh - as bootstrap profile"
        . $script_dir/bin/epilogue_profile.sh
        export PATH=$install_dir/bin:$PATH
    else
        echo "Loading $install_dir/bin/profile.sh - as bootstrap profile"
        . $install_dir/bin/profile.sh
    fi
fi

if ! test -f $install_dir/bin/profile.sh; then
    echo "Loading $script_dir/bin/epilogue_profile.sh - as bootstrap profile"
    . $script_dir/bin/epilogue_profile.sh
    export PATH=$install_dir/bin:$PATH
fi

if test -f $install_dir/bin/libtool-bak; then
    mv $install_dir/bin/libtool-bak $install_dir/bin/libtool
fi

#----------------------------------------------------------------------------------------------------------------------
#
#
export OMNIA_HOME=$install_dir

export CARGO_HOME=$OMNIA_HOME/.cargo

mkdir -p $install_dir
export install_dir=$(realpath $install_dir)

export build_dir=$install_dir/.build/build

rm -rf $build_dir
mkdir -p $build_dir 
pushd $build_dir


if ! command -v gcc 2>&1 >/dev/null
then
    echo ""
    echo "GCC/G++ is not installed -  base OOTB GCC is required to move forward"
    echo "sudo yum install -y gcc"
    echo ""
    exit 1
fi

#if ! command -v python3 2>&1 >/dev/null
#then
#    echo ""
#    echo "python3 is not installed -  base OOTB python3.12 is required to move forward"
#    echo "sudo yum install -y python3.12"
#    echo ""
#    exit 1
#fi


if ! command -v make 2>&1 >/dev/null
then
    echo "Make utility doesnt exist - need to bootstrap it"
    LDFLAGS="" generic_build.sh make make-4.4.1 $install_dir $script_dir --disable-dependency-tracking
    if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
fi

export SSL_CERT_FILE=$OMNIA_HOME/etc/ssl/certs/cacert.pem

mkdir -p $HOME/.cache/bazel

#----------------------------------------------------------------------------------------------------------------------
#
#
#rm $install_dir/.build/libiconv
make -f $script_dir/Makefile all 2>&1 | tee $install_dir/logs/log.$current_time
if [ $? -ne 0 ]; then 
    echo “Error detected” ; exit 1 ; 
fi

#rm -rf build/*
#rm -rf $install_dir/build
#rm -rf $install_dir/build-1
rm -rf $install_dir/cgi-bin
rm -rf $install_dir/manual
rm -rf $install_dir/demo


#rm -rf $install_dir/tmp

echo ""
echo "Build Complete"
popd
exit


#docker container run --privileged --rm --net host -e DISPLAY=$DISPLAY -v epilogue-praxis:/home/rsewell -v builds:/data/.omnia -v /opt/intel:/opt/intel -v /home/rsewell/Projects:/home/rsewell/Projects -it --name praxis --user rsewell rsewell/praxis-v3

#----------------------------------------------------------------------------------------------------------------------
# mbedtls
#
##    if ! test -f $install_dir/.build/mbedtls.done; then
##        echo "OMNIA: Building mbedtls"
##        tar -xvf $script_dir/tools/mbedtls-3.6.0.tar.gz
##        pushd mbedtls-3.6.0
##        export DESTDIR=$install_dir
##        make 
##        if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
##        make install
##        if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
##        popd
##        rm -rf *
##        touch $install_dir/.build/mbedtls.done
##    fi

#https://llvm.org/docs/ProgrammersManual.html
#https://ftp.gnu.org/gnu/


#docker tag epilogue-praxis rsewell/epilogue-praxis
#docker container commit rsewell/epilogue-praxis epilogue-praxis


#sudo launchctl limit maxfiles 1000000 1000000
#/etc/launchd.conf



### Samba
### Elixir & Frameworks
### Erlang Frameworks
### Rabbit MQ
### CouchDB
### AIO Libs
### Julia
### R
### Graal
### Rust?
### OpenSSH
### OneAPI
### awscli
### gitea
### cron
### 
### Matlab
### Mathematica
### Cuda
