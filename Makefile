#---------------------------------------------------------------------------------------------------------------------------------------
# Global Settings
#
install_dir ?= $(HOME)/.omnia
iconv_dir ?= $(install_dir)
build_dir ?= $(HOME)/Temp/build
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
script_dir := $(dir $(mkfile_path))
orig_path := $(PATH)
orig_dyld_path := $(DYLD_LIBRARY_PATH)
orig_ld_path := $(LD_LIBRARY_PATH)
dyld_path := $(if $(DYLD_LIBRARY_PATH),$(install_dir)/opt/llvm/lib:$(install_dir)/lib:$(DYLD_LIBRARY_PATH),$(install_dir)/opt/llvm/lib:$(install_dir)/lib)
ld_path := $(if $(LD_LIBRARY_PATH),$(install_dir)/opt/llvm/lib:$(install_dir)/lib:$(LD_LIBRARY_PATH),$(install_dir)/opt/llvm/lib:$(install_dir)/lib)

ignore_these_errors=-Wno-return-mismatch -Wno-old-style-definition -Wno-attributes -Wno-int-conversion -Wno-implicit-int -Wno-implicit-function-declaration -Wno-format-nonliteral -Wno-incompatible-pointer-types -Wno-missing-include-dirs 

export LDFLAGS=-L$(install_dir)/lib -L$(install_dir)/lib64
export CPPFLAGS=-fPIC -I$(install_dir)/include -I$(install_dir)/include/suitesparse -Wno-attributes -Wno-implicit-fallthrough -Wno-unused-command-line-argument
export CXXFLAGS=$(CPPFLAGS)
export CFLAGS=-O3 -fPIC -I$(install_dir)/include -I$(install_dir)/include/ncursesw $(ignore_these_errors) 
export PKG_CONFIG_PATH=$(install_dir)/lib/pkgconfig:$(install_dir)/lib64/pkgconfig
export DYLD_LIBRARY_PATH=$(orig_dyld_path)
export LD_LIBRARY_PATH=$(orig_ld_path)

UNAME_S := $(shell uname -s)
UNAME_P := $(shell uname -a)

SUDO=

#-Wno-class-memaccess 	
#---------------------------------------------------------------------------------------------------------------------------------------
# Languages Provided: Erlang, Elixir, GCC, GFortran, LLVM, DPC++, Python3, Rust, Sage, TCL, Perl, SWI Prolog, Julia
# R 
#
include $(script_dir)/versions.mk

CLASSPATH=$(install_dir)/lib/gson-2.13.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/activation-1.1.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/ant-antlr-1.10.15.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/antlr4-runtime-4.13.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/asm-3.3.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/avalon-framework-4.1.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/batik-all-1.17.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/checkstyle-10.17.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/cobertura-2.1.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/commons-beanutils-1.9.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/commons-codec-1.15.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/commons-collections-3.2.2.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/commons-io-2.11.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/commons-logging-1.1.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/ecj-3.37.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/flatlaf-3.4.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/flexdock-1.2.5.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/fontbox-2.0.27.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/fop-2.9.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/fop-core-2.9.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/fop-events-2.9.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/fop-util-2.9.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/freehep-graphics2d-2.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/freehep-graphicsbase-2.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/freehep-graphicsio-2.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/freehep-graphicsio-emf-2.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/freehep-io-2.2.2.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/gluegen-rt-2.2.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/gluegen-rt-2.5.0
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/gluegen-rt.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/gson-2.10.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/guava-32.1.1-jre.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/guava-33.2.0-jre.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/httpclient5-5.1.3.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/httpcore5-5.1.3.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/istack-commons-runtime-4.2.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/javafx.base.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/javafx.graphics.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/javafx.swing.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/javax.activation-api-1.2.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/javax.annotation-api-1.3.2.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jaxb-api-2.3.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jaxb-impl-2.3.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jaxb-runtime-2.3.1.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jcef-99c2f7a9c74b.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jeuclid-core-3.1.14.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jgoodies-looks-2.7.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jgraphx-2.1.0.7.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jhall-2.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jlatexmath-1.0.7.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jlatexmath-font-cyrillic-1.0.7.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jlatexmath-font-greek-1.0.7.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jlatexmath-fop-1.0.7.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jogl-all-2.2.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jogl-all-2.5.0-natives-linux-aarch64
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jrosetta-API-1.0.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/jrosetta-engine-1.0.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/junit-4.10.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/lucene-analysis-common-9.10.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/lucene-core-9.10.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/lucene-queryparser-9.10.0.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/qdox-1.12.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/Saxon-HE-12.4.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/skinlf-1.2.3.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/slf4j-api-1.7.25.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/xml-apis-1.4.01.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/xml-apis-ext-1.3.04.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/xmlgraphics-commons-2.9.jar
CLASSPATH:=$(CLASSPATH):$(install_dir)/lib/xmlresolver-6.0.4.jar

export CLASSPATH

os_linux =
os_darwin =
#experimental = 0
#---------------------------------------------------------------------------------------------------------------------------------------
# CPU Agnostic Linux Setup
#
ifeq ($(UNAME_S),Linux)
	os_linux = 1
	iconv_dir = $(install_dir)/tmp
	llvm_dir = $(install_dir)

	#-------------------------------------------------------------------------------------------------------------------------------
	# AMD/Intel 64 Setup
	#
	binaries=$(script_dir)/bin/linux-x64
	no_arch=$(script_dir)/bin/no-arch

	#-------------------------------------------------------------------------------------------------------------------------------
	# ARM Setup
	#
	ifneq ($(filter aarch64%,$(UNAME_P)),)
		binaries=$(script_dir)/bin/linux-arm
	endif

	export LDFLAGS+= -Wl,-rpath,$(install_dir)/lib
	export PKG_CONFIG_PATH=$(install_dir)/lib/pkgconfig:$(install_dir)/lib64/pkgconfig
endif

#---------------------------------------------------------------------------------------------------------------------------------------
# CPU Agnostic Darwin Setup
#
ifeq ($(UNAME_S),Darwin)
	os_darwin = 1
	llvm_dir = $(install_dir)/opt/llvm-intel-dpc++
	export CFLAGS+=-Wno-gnu-include-next
	export CPPFLAGS+=-Wno-gnu-include-next
	export CXXFLAGS=$(CPPFLAGS)
	export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true
	export LD_LIBRARY_PATH=$(orig_dyld_path)

	binaries=$(script_dir)/bin/osx-arm
endif

PATH += ":$(binaries)"


#---------------------------------------------------------------------------------------------------------------------------------------
# 
#
define deploy
	build_dir = $(pwd) && pushd $(5)/.. && tar cf - $(2) | ( cd $build_dir ; tar xfv -) && popd
endef

#---------------------------------------------------------------------------------------------------------------------------------------
# 
#
define stage
	echo $(2)
	find $(4)/components -maxdepth 2 -type d -name $(2) -print -exec $script_dir/scripts/deploy.sh $(1) $(2) $(3) $(4) {} \;
	if [ ! -d $(pwd)/$(2) ]; then
		find $(4)/components -maxdepth 2 -name $(2).tar.gz -print -exec tar -xvf {} \;
		if [ ! -d $(pwd)/$(2) ]; then
			pushd $(4)/modules    
			tar cf - $(2) | ( cd $(3) ; tar xfv -)
			if [ $? -ne 0 ]; then echo “Error detected” ; exit 1 ; fi
			popd
		fi
	fi
endef




#---------------------------------------------------------------------------------------------------------------------------------------
#
#
spirv-tools_tag="epilogue-praxis"

prerequisites:
	@pushd modules/spirv-tools && git checkout $(spirv-tools_tag) && popd

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
#---------------------------------------------------------------------------------------------------------------------------------------
#
#
setup:
	@mkdir -p $(install_dir)/bin     		; \
	mkdir -p $(install_dir)/lib     		; \
	mkdir -p $(install_dir)/apps     		; \
	mkdir -p $(install_dir)/config     		; \
	mkdir -p $(install_dir)/conf    		; \
	mkdir -p $(install_dir)/demo    		; \
  	mkdir -p $(install_dir)/doc     		; \
  	mkdir -p $(install_dir)/error   		; \
  	mkdir -p $(install_dir)/etc     		; \
  	mkdir -p $(install_dir)/htdocs  		; \
  	mkdir -p $(install_dir)/html    		; \
  	mkdir -p $(install_dir)/icons   		; \
  	mkdir -p $(install_dir)/include 		; \
  	mkdir -p $(install_dir)/jmods   		; \
  	mkdir -p $(install_dir)/legal   		; \
  	mkdir -p $(install_dir)/lib     		; \
		ln -sf lib $(install_dir)/lib64		; \
  	mkdir -p $(install_dir)/lib/perl     		; \
  	mkdir -p $(install_dir)/libexec 		; \
  	mkdir -p $(install_dir)/log     		; \
  	mkdir -p $(install_dir)/logs    		; \
  	mkdir -p $(install_dir)/man     		; \
  	mkdir -p $(install_dir)/modules 		; \
  	mkdir -p $(install_dir)/sbin    		; \
  	mkdir -p $(install_dir)/servers 		; \
  	mkdir -p $(install_dir)/share			; \
	mkdir -p $(install_dir)/lib/tcl8.6/omnia/	; \
	mkdir -p $(install_dir)/lib/tcl8.6/katana/	; \
	mkdir -p $(install_dir)/.build			; \
	mkdir -p $(install_dir)/tmp			; \
	mkdir -p $(install_dir)/opt

#---------------------------------------------------------------------------------------------------------------------------------------
# Perl
#
$(install_dir)/.build/perl-font-tif:		$(script_dir)/components/perl/Font-TTF-1.06.tar.gz
	@generic_build.sh perl-font-tif Font-TTF-1.06 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/perl-font-tif

$(install_dir)/.build/perl-io-string:		$(script_dir)/components/perl/IO-String-1.08.tar.gz
	@generic_build.sh perl-io-string IO-String-1.08 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/perl-io-string

#---------------------------------------------------------------------------------------------------------------------------------------
# Python
#
$(install_dir)/.build/python-pkgs:		$(install_dir)/.build/attrs								\
						$(install_dir)/.build/setuptools							\
						$(install_dir)/.build/docutils								\
						$(install_dir)/.build/cython								\
						$(install_dir)/.build/markupsafe							\
						$(install_dir)/.build/typing_extensions							\
						$(install_dir)/.build/pango-py								\
						$(install_dir)/.build/pillow								\
						$(install_dir)/.build/matplotlib							\
						$(install_dir)/.build/ply								\
						$(install_dir)/.build/cachetools							\
						$(install_dir)/.build/pdflatex								\
						$(install_dir)/.build/chardet								\
						$(install_dir)/.build/colorama								\
						$(install_dir)/.build/boto3								\
						$(install_dir)/.build/botocore								\
						$(install_dir)/.build/s3transfer							\
						$(install_dir)/.build/jmespath								\
						$(install_dir)/.build/requests								\
						$(install_dir)/.build/urllib3								\
						$(install_dir)/.build/certifi								\
						$(install_dir)/.build/annotated_types							\
						$(install_dir)/.build/pytz								\
						$(install_dir)/.build/tzdata								\
						$(install_dir)/.build/pandas								\
						$(install_dir)/.build/tabulate								\
						$(install_dir)/.build/bcrypt								\
						$(install_dir)/.build/click								\
						$(install_dir)/.build/ecdsa								\
						$(install_dir)/.build/charset_normalizer						\
						$(install_dir)/.build/traitlets								\
						$(install_dir)/.build/pathspec								\
						$(install_dir)/.build/pluggy								\
						$(install_dir)/.build/trove_classifiers							\
						$(install_dir)/.build/pyzmq								\
						$(install_dir)/.build/tornado								\
						$(install_dir)/.build/setproctitle							\
						$(install_dir)/.build/hvac								\
						$(install_dir)/.build/tenacity								\
						$(install_dir)/.build/brotli-asgi							\
						$(install_dir)/.build/uvicorn								\
						$(install_dir)/.build/starlette								\
						$(install_dir)/.build/sqlalchemy							\
						$(install_dir)/.build/greenlet								\
						$(install_dir)/.build/h11								\
						$(install_dir)/.build/passlib								\
						$(install_dir)/.build/pyasn								\
						$(install_dir)/.build/pydantic								\
						$(install_dir)/.build/pydantic_core							\
						$(install_dir)/.build/python_jose							\
						$(install_dir)/.build/python_multipart							\
						$(install_dir)/.build/fastapi								\
						$(install_dir)/.build/typing_inspection							\
						$(install_dir)/.build/brotli-py								\
						$(install_dir)/.build/pyasn1								\
						$(install_dir)/.build/rsa_python							\
						$(install_dir)/.build/rsa								\
						$(install_dir)/.build/types_python_dateutil						\
						$(install_dir)/.build/six								\
						$(install_dir)/.build/python-dateutil							\
						$(install_dir)/.build/admcycles								\
						$(install_dir)/.build/alabaster								\
						$(install_dir)/.build/idna								\
						$(install_dir)/.build/sniffio								\
						$(install_dir)/.build/exceptiongroup							\
						$(install_dir)/.build/anyio								\
						$(install_dir)/.build/appdirs								\
						$(install_dir)/.build/appnope								\
						$(install_dir)/.build/argon2-cffi-bindings						\
						$(install_dir)/.build/flit_core								\
						$(install_dir)/.build/cffi								\
						$(install_dir)/.build/pycparser								\
						$(install_dir)/.build/arrow								\
						$(install_dir)/.build/psycopg2								\
						$(install_dir)/.build/wheel								\
						$(install_dir)/.build/pyinfo								\
						$(install_dir)/.build/scheduler								\
						$(install_dir)/.build/rules-engine							\
						$(install_dir)/.build/raft								\
						$(install_dir)/.build/pykka								\
						$(install_dir)/.build/pykka-injector							\
						$(install_dir)/.build/pyakka								\
						$(install_dir)/.build/py-raft								\
						$(install_dir)/.build/dask								\
						$(install_dir)/.build/csvkit								\
						$(install_dir)/.build/crontab								\
						$(install_dir)/.build/flask								\
						$(install_dir)/.build/blambda								\
						$(install_dir)/.build/brolog								\
						$(install_dir)/.build/clopure								\
						$(install_dir)/.build/django								\
						$(install_dir)/.build/django_cms							\
						$(install_dir)/.build/pyrsl								\
						$(install_dir)/.build/prql								\
						$(install_dir)/.build/prolog-interface							\
						$(install_dir)/.build/datamesh		
	@touch $(install_dir)/.build/python-pkgs


#---------------------------------------------------------------------------------------------------------------------------------------
# Build a python package - default version
#
define pipmk
	stage.sh $(1) $(2) $(3) $(4) 
	pushd $(2) && python3 -m pip install --no-deps --ignore-installed --compile --no-cache-dir --disable-pip-version-check . && popd && rm -rf *
	touch $(3)/.build/$(1)
endef

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
define sipmk
	stage.sh $(1) $(2) $(3) $(4) 
	pushd $(2) && sip-install --confirm-license && popd && rm -rf *
	touch $(3)/.build/$(1)
endef

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
define pipmk_skip
	touch $(3)/.build/$(1)
endef

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
define sipmk_skip
	touch $(3)/.build/$(1)
endef


#---------------------------------------------------------------------------------------------------------------------------------------
#
#
define gitmk
	@pushd $(4) && git submodule update --recursive --remote --force modules/$(1) && popd 	
	@pushd $(4)/modules/$(1) && git checkout $(2) && popd 	
endef

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/.build/xlsxwriter:			
	@$(call pipmk,xlsxwriter,$(xlsxwriter_v),$(install_dir),$(script_dir))

$(install_dir)/.build/splunk-sdk:		$(install_dir)/.build/deprecation		
	@$(call pipmk,splunk-sdk,$(splunk-sdk_v),$(install_dir),$(script_dir))

$(install_dir)/.build/deprecation:			
	@$(call pipmk,deprecation,$(deprecation_v),$(install_dir),$(script_dir))

$(install_dir)/.build/cryptography:			
	@$(call pipmk,cryptography,$(cryptography_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyjwt:			
	@$(call pipmk,pyjwt,$(pyjwt_v),$(install_dir),$(script_dir))

$(install_dir)/.build/msal:			
	@$(call pipmk,msal,$(msal_v),$(install_dir),$(script_dir))

$(install_dir)/.build/awscli:			
	@$(call pipmk,awscli,$(awscli_v),$(install_dir),$(script_dir))

$(install_dir)/.build/airflow-task-sdk:			
	@$(call pipmk,airflow-task-sdk,$(airflow-task-sdk_v),$(install_dir),$(script_dir))

$(install_dir)/.build/airflow-core:			
	@$(call pipmk,airflow-core,$(airflow-core_v),$(install_dir),$(script_dir))

$(install_dir)/.build/airflow:			$(install_dir)/.build/airflow-core							\
						$(install_dir)/.build/airflow-task-sdk	
	@$(call pipmk,airflow,$(airflow_v),$(install_dir),$(script_dir))

$(install_dir)/.build/sip:			$(script_dir)/components/python/$(sip_v).tar.gz
	@$(call pipmk,sip,$(sip_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyqt_builder:		$(install_dir)/.build/sip								\
						$(script_dir)/components/python/$(pyqt_builder_v).tar.gz
	@$(call pipmk,pyqt_builder,$(pyqt_builder_v),$(install_dir),$(script_dir))

$(install_dir)/.build/markdown:			$(script_dir)/components/python/$(markdown_v).tar.gz
	@$(call pipmk,markdown,$(markdown_v),$(install_dir),$(script_dir))

$(install_dir)/.build/polars:			$(script_dir)/components/python/$(polars_v).tar.gz
	@$(call pipmk,polars,$(polars_v),$(install_dir),$(script_dir))

$(install_dir)/.build/attrs18:			$(install_dir)/.build/sed								\
						$(script_dir)/components/python/$(attrs18_v).tar.gz
	@$(call pipmk,attrs18,$(attrs18_v),$(install_dir),$(script_dir))
	@sed -i 's/Name: attrs/Name: attrs18/g' $(install_dir)/lib/python3.12/site-packages/$(attrs18_v).dist-info/METADATA
	@version=$(echo "$(attrs18_v)" | grep -oP '(?<=-)([0-9]+\.?)+') && 								\
		mv $(install_dir)/lib/python3.12/site-packages/$(attrs18_v).dist-info $(install_dir)/lib/python3.12/site-packages/attrs18-$(version).dist-info

$(install_dir)/.build/dbfread:			$(script_dir)/components/python/$(dbfread_v).tar.gz
	@$(call pipmk,dbfread,$(dbfread_v),$(install_dir),$(script_dir))

$(install_dir)/.build/locket:			$(script_dir)/components/python/$(locket_v).tar.gz
	@$(call pipmk,locket,$(locket_v),$(install_dir),$(script_dir))

$(install_dir)/.build/text-unidecode:		$(script_dir)/components/python/$(text-unidecode_v).tar.gz
	@$(call pipmk,text-unidecode,$(text-unidecode_v),$(install_dir),$(script_dir))

$(install_dir)/.build/toolz:			$(script_dir)/components/python/$(toolz_v).tar.gz
	@$(call pipmk,toolz,$(toolz_v),$(install_dir),$(script_dir))

$(install_dir)/.build/partd:			$(install_dir)/.build/locket								\
						$(script_dir)/components/python/$(partd_v).tar.gz
	@$(call pipmk,partd,$(partd_v),$(install_dir),$(script_dir))

$(install_dir)/.build/fsspec:			$(script_dir)/components/python/$(fsspec_v).tar.gz
	@$(call pipmk,fsspec,$(fsspec_v),$(install_dir),$(script_dir))

$(install_dir)/.build/cloudpickle:		$(script_dir)/components/python/$(cloudpickle_v).tar.gz
	@$(call pipmk,cloudpickle,$(cloudpickle_v),$(install_dir),$(script_dir))

$(install_dir)/.build/babel:			$(script_dir)/components/python/$(babel_v).tar.gz
	@$(call pipmk,babel,$(babel_v),$(install_dir),$(script_dir))

$(install_dir)/.build/isodate:			$(script_dir)/components/python/$(isodate_v).tar.gz
	@$(call pipmk,isodate,$(isodate_v),$(install_dir),$(script_dir))

$(install_dir)/.build/leather:			$(script_dir)/components/python/$(leather_v).tar.gz
	@$(call pipmk,leather,$(leather_v),$(install_dir),$(script_dir))

$(install_dir)/.build/parsedatetime:		$(script_dir)/components/python/$(parsedatetime_v).tar.gz
	@$(call pipmk,parsedatetime,$(parsedatetime_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pytimeparse:		$(script_dir)/components/python/$(pytimeparse_v).tar.gz
	@$(call pipmk,pytimeparse,$(pytimeparse_v),$(install_dir),$(script_dir))

$(install_dir)/.build/python-slugify:		$(install_dir)/.build/text-unidecode							\
						$(script_dir)/components/python/$(python-slugify_v).tar.gz
	@$(call pipmk,python-slugify,$(python-slugify_v),$(install_dir),$(script_dir))

$(install_dir)/.build/olefile:			
	@$(call pipmk,olefile,$(olefile_v),$(install_dir),$(script_dir))

$(install_dir)/.build/xlrd:			$(script_dir)/components/python/$(xlrd_v).tar.gz
	@$(call pipmk,xlrd,$(xlrd_v),$(install_dir),$(script_dir))

$(install_dir)/.build/agate:			$(install_dir)/.build/babel								\
						$(install_dir)/.build/isodate								\
						$(install_dir)/.build/leather								\
						$(install_dir)/.build/parsedatetime							\
						$(install_dir)/.build/pytimeparse							\
						$(install_dir)/.build/python-slugify							\
						$(script_dir)/components/python/$(agate_v).tar.gz
	@$(call pipmk,agate,$(agate_v),$(install_dir),$(script_dir))

$(install_dir)/.build/agate-dbf:		$(install_dir)/.build/dbfread								\
						$(script_dir)/components/python/$(agate-dbf_v).tar.gz
	@$(call pipmk,agate-dbf,$(agate-dbf_v),$(install_dir),$(script_dir))

$(install_dir)/.build/agate-excel:		$(install_dir)/.build/olefile								\
						$(install_dir)/.build/xlrd								\
						$(script_dir)/components/python/$(agate-excel_v).tar.gz
	@$(call pipmk,agate-excel,$(agate-excel_v),$(install_dir),$(script_dir))

$(install_dir)/.build/agate-sql:		$(script_dir)/components/python/$(agate-sql_v).tar.gz
	@$(call pipmk,agate-sql,$(agate-sql_v),$(install_dir),$(script_dir))

$(install_dir)/.build/wcwidth:			$(script_dir)/components/python/$(wcwidth_v).tar.gz
	@$(call pipmk,wcwidth,$(wcwidth_v),$(install_dir),$(script_dir))

$(install_dir)/.build/antlr4-python3-runtime:	$(script_dir)/components/python/$(antlr4-python3-runtime_v).tar.gz
	@$(call pipmk,antlr4-python3-runtime,$(antlr4-python3-runtime_v),$(install_dir),$(script_dir))

$(install_dir)/.build/et_xmlfile:		$(script_dir)/components/python/$(et_xmlfile_v).tar.gz
	@$(call pipmk,et_xmlfile,$(et_xmlfile_v),$(install_dir),$(script_dir))

$(install_dir)/.build/mdurl:			$(script_dir)/components/python/$(mdurl_v).tar.gz
	@$(call pipmk,mdurl,$(mdurl_v),$(install_dir),$(script_dir))

$(install_dir)/.build/markdown-it-py:		$(install_dir)/.build/mdurl								\
						$(script_dir)/components/python/$(markdown-it-py_v).tar.gz
	@$(call pipmk,markdown-it-py,$(markdown-it-py_v),$(install_dir),$(script_dir))

$(install_dir)/.build/ptyprocess:		$(script_dir)/components/python/$(ptyprocess_v).tar.gz
	@$(call pipmk,ptyprocess,$(ptyprocess_v),$(install_dir),$(script_dir))

$(install_dir)/.build/optree:			$(script_dir)/components/python/$(optree_v).tar.gz
	@$(call pipmk,optree,$(optree_v),$(install_dir),$(script_dir))

$(install_dir)/.build/namex:			$(script_dir)/components/python/$(namex_v).tar.gz
	@$(call pipmk,namex,$(namex_v),$(install_dir),$(script_dir))

$(install_dir)/.build/openpyxl:			$(install_dir)/.build/et_xmlfile							\
						$(script_dir)/components/python/$(openpyxl_v).tar.gz
	@$(call pipmk,openpyxl,$(openpyxl_v),$(install_dir),$(script_dir))

$(install_dir)/.build/werkzeug:			$(script_dir)/components/python/$(werkzeug_v).tar.gz
	@$(call pipmk,werkzeug,$(werkzeug_v),$(install_dir),$(script_dir))

$(install_dir)/.build/itsdangerous:		$(script_dir)/components/python/$(itsdangerous_v).tar.gz
	@$(call pipmk,itsdangerous,$(itsdangerous_v),$(install_dir),$(script_dir))

$(install_dir)/.build/blinker:			$(script_dir)/components/python/$(blinker_v).tar.gz
	@$(call pipmk,blinker,$(blinker_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pexpect:			$(install_dir)/.build/ptyprocess							\
						$(script_dir)/components/python/$(pexpect_v).tar.gz
	@$(call pipmk,pexpect,$(pexpect_v),$(install_dir),$(script_dir))

$(install_dir)/.build/injector:			$(script_dir)/components/python/$(injector_v).tar.gz
	@$(call pipmk,injector,$(injector_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyxtuml:			$(script_dir)/components/python/$(pyxtuml_v).tar.gz
	@$(call pipmk,pyxtuml,$(pyxtuml_v),$(install_dir),$(script_dir))

$(install_dir)/.build/threadpoolctl:		$(script_dir)/components/python/$(threadpoolctl_v).tar.gz
	@$(call pipmk,threadpoolctl,$(threadpoolctl_v),$(install_dir),$(script_dir))

$(install_dir)/.build/joblib:			$(script_dir)/components/python/$(joblib_v).tar.gz
	@$(call pipmk,joblib,$(joblib_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyqt5_sip:		$(install_dir)/.build/qt5								\
						$(script_dir)/components/python/$(pyqt5_sip_v).tar.gz
	@$(call pipmk,pyqt5_sip,$(pyqt5_sip_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyqt5:			$(install_dir)/.build/pyqt_builder							\
						$(install_dir)/.build/pyqt5_sip								\
						$(script_dir)/components/python/$(pyqt5_v).tar.gz
	@$(call sipmk,pyqt5,$(pyqt5_v),$(install_dir),$(script_dir))

$(install_dir)/.build/typeguard:		$(script_dir)/components/python/$(typeguard_v).tar.gz
	@$(call pipmk,typeguard,$(typeguard_v),$(install_dir),$(script_dir))

$(install_dir)/.build/wrapt:			$(script_dir)/components/python/$(wrapt_v).tar.gz
	@$(call pipmk,wrapt,$(wrapt_v),$(install_dir),$(script_dir))

$(install_dir)/.build/termcolor:		$(script_dir)/components/python/$(termcolor_v).tar.gz
	@$(call pipmk,termcolor,$(termcolor_v),$(install_dir),$(script_dir))

$(install_dir)/.build/protobuf:			$(script_dir)/components/python/$(protobuf_v).tar.gz
	@$(call pipmk,protobuf,$(protobuf_v),$(install_dir),$(script_dir))

$(install_dir)/.build/opt_einsum:		$(script_dir)/components/python/$(opt_einsum_v).tar.gz
	@$(call pipmk,opt_einsum,$(opt_einsum_v),$(install_dir),$(script_dir))

$(install_dir)/.build/ml_dtypes:		$(script_dir)/components/python/$(ml_dtypes_v).tar.gz
	@$(call pipmk,ml_dtypes,$(ml_dtypes_v),$(install_dir),$(script_dir))

$(install_dir)/.build/google-pasta:		$(script_dir)/components/python/$(google-pasta_v).tar.gz
	@$(call pipmk,google-pasta,$(google-pasta_v),$(install_dir),$(script_dir))

$(install_dir)/.build/libclang:			$(script_dir)/components/python/$(libclang_v).tar.gz
	@$(call pipmk,libclang,$(libclang_v),$(install_dir),$(script_dir))

$(install_dir)/.build/grpcio:			$(script_dir)/components/python/$(grpcio_v).tar.gz
	@$(call pipmk,grpcio,$(grpcio_v),$(install_dir),$(script_dir))

$(install_dir)/.build/flatbuffers:		$(script_dir)/components/python/$(flatbuffers_v).tar.gz
	@$(call pipmk,flatbuffers,$(flatbuffers_v),$(install_dir),$(script_dir))

$(install_dir)/.build/astunparse:		$(script_dir)/components/python/$(astunparse_v).tar.gz
	@$(call pipmk,astunparse,$(astunparse_v),$(install_dir),$(script_dir))

$(install_dir)/.build/absl_py:			$(script_dir)/components/python/$(absl_py_v).tar.gz
	@$(call pipmk,absl_py,$(absl_py_v),$(install_dir),$(script_dir))

$(install_dir)/.build/asyncio:			$(script_dir)/components/python/$(asyncio_v).tar.gz
	@$(call pipmk,asyncio,$(asyncio_v),$(install_dir),$(script_dir))

$(install_dir)/.build/prompt_toolkit:		$(install_dir)/.build/wcwidth								\
						$(script_dir)/components/python/$(prompt_toolkit_v).tar.gz
	@$(call pipmk,prompt_toolkit,$(prompt_toolkit_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pygments:			$(script_dir)/components/python/$(pygments_v).tar.gz
	@$(call pipmk,pygments,$(pygments_v),$(install_dir),$(script_dir))

$(install_dir)/.build/rich:			$(install_dir)/.build/markdown-it-py							\
						$(script_dir)/components/python/$(rich_v).tar.gz
	@$(call pipmk,rich,$(rich_v),$(install_dir),$(script_dir))

$(install_dir)/.build/runtype:			$(script_dir)/components/python/$(runtype_v).tar.gz
	@$(call pipmk,runtype,$(runtype_v),$(install_dir),$(script_dir))

$(install_dir)/.build/tqdm:			$(script_dir)/components/python/$(tqdm_v).tar.gz
	@$(call pipmk,tqdm,$(tqdm_v),$(install_dir),$(script_dir))

$(install_dir)/.build/lark-parser:		$(script_dir)/components/python/$(lark-parser_v).tar.gz
	@$(call pipmk,lark-parser,$(lark-parser_v),$(install_dir),$(script_dir))

$(install_dir)/.build/dsnparse:			$(script_dir)/components/python/$(dsnparse_v).tar.gz
	@$(call pipmk,dsnparse,$(dsnparse_v),$(install_dir),$(script_dir))

$(install_dir)/.build/sqlparse:			$(script_dir)/components/python/$(sqlparse_v).tar.gz
	@$(call pipmk,sqlparse,$(sqlparse_v),$(install_dir),$(script_dir))

$(install_dir)/.build/asgiref:			$(script_dir)/components/python/$(asgiref_v).tar.gz
	@$(call pipmk,asgiref,$(asgiref_v),$(install_dir),$(script_dir))

$(install_dir)/.build/django-classy-tags:	$(script_dir)/components/python/$(django-classy-tags_v).tar.gz
	@$(call pipmk,django-classy-tags,$(django-classy-tags_v),$(install_dir),$(script_dir))

$(install_dir)/.build/django-formtools:		$(script_dir)/components/python/$(django-formtools_v).tar.gz
	@$(call pipmk,django-formtools,$(django-formtools_v),$(install_dir),$(script_dir))

$(install_dir)/.build/django-sekizai:		$(script_dir)/components/python/$(django-sekizai_v).tar.gz
	@$(call pipmk,django-sekizai,$(django-sekizai_v),$(install_dir),$(script_dir))

$(install_dir)/.build/django-treebeard:		$(script_dir)/components/python/$(django-treebeard_v).tar.gz
	@$(call pipmk,django-treebeard,$(django-treebeard_v),$(install_dir),$(script_dir))

$(install_dir)/.build/djangocms-admin-style:	$(script_dir)/components/python/$(djangocms-admin-style_v).tar.gz
	@$(call pipmk,djangocms-admin-style,$(djangocms-admin-style_v),$(install_dir),$(script_dir))

$(install_dir)/.build/coherent_licensed:	$(install_dir)/.build/flit_core								\
						$(script_dir)/components/python/$(coherent_licensed_v).tar.gz
	@$(call pipmk,coherent_licensed,$(coherent_licensed_v),$(install_dir),$(script_dir))

$(install_dir)/.build/datamesh:			$(script_dir)/components/python/$(datamesh_v).tar.gz
	@$(call pipmk,datamesh,$(datamesh_v),$(install_dir),$(script_dir))

$(install_dir)/.build/prolog-interface:		$(install_dir)/.build/pexpect								\
						$(script_dir)/components/python/$(prolog-interface_v).tar.gz
	@$(call pipmk,prolog-interface,$(prolog-interface_v),$(install_dir),$(script_dir))

$(install_dir)/.build/prql:			$(install_dir)/.build/prompt_toolkit							\
						$(install_dir)/.build/pygments								\
						$(install_dir)/.build/rich								\
						$(install_dir)/.build/runtype								\
						$(install_dir)/.build/tqdm								\
						$(install_dir)/.build/lark-parser							\
						$(install_dir)/.build/dsnparse								\
						$(script_dir)/components/python/$(prql_v).tar.gz
	@$(call pipmk,prql,$(prql_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyrsl:			$(install_dir)/.build/pyxtuml								\
						$(script_dir)/components/python/$(pyrsl_v).tar.gz
	@$(call pipmk,pyrsl,$(pyrsl_v),$(install_dir),$(script_dir))

$(install_dir)/.build/django_cms:		$(install_dir)/.build/django-classy-tags						\
						$(install_dir)/.build/django-formtools							\
						$(install_dir)/.build/django-sekizai							\
						$(install_dir)/.build/django-treebeard							\
						$(install_dir)/.build/djangocms-admin-style						\
						$(script_dir)/components/python/$(django_cms_v).tar.gz
	@$(call pipmk,django_cms,$(django_cms_v),$(install_dir),$(script_dir))

$(install_dir)/.build/django:			$(install_dir)/.build/asgiref								\
						$(install_dir)/.build/sqlparse								\
						$(script_dir)/components/python/$(django_v).tar.gz
	@$(call pipmk,django,$(django_v),$(install_dir),$(script_dir))

$(install_dir)/.build/clopure:			$(script_dir)/components/python/$(clopure_v).tar.gz
	@$(call pipmk,clopure,$(clopure_v),$(install_dir),$(script_dir))

$(install_dir)/.build/brolog:			$(script_dir)/components/python/$(brolog_v).tar.gz
	@$(call pipmk,brolog,$(brolog_v),$(install_dir),$(script_dir))

$(install_dir)/.build/blambda:			$(script_dir)/components/python/$(blambda_v).tar.gz
	@$(call pipmk,blambda,$(blambda_v),$(install_dir),$(script_dir))

#$(install_dir)/.build/antlr-ast:		$(install_dir)/.build/antlr4-python3-runtime						\
#						$(script_dir)/components/python/$(antlr-ast_v).tar.gz
#	@$(call pipmk,antlr-ast,$(antlr-ast_v),$(install_dir),$(script_dir))

$(install_dir)/.build/flask:			$(install_dir)/.build/werkzeug								\
						$(install_dir)/.build/itsdangerous							\
						$(install_dir)/.build/blinker								\
						$(script_dir)/components/python/$(flask_v).tar.gz
	@$(call pipmk,flask,$(flask_v),$(install_dir),$(script_dir))

$(install_dir)/.build/crontab:			$(script_dir)/components/python/$(crontab_v).tar.gz
	@$(call pipmk,crontab,$(crontab_v),$(install_dir),$(script_dir))

$(install_dir)/.build/csvkit:			$(install_dir)/.build/agate								\
						$(install_dir)/.build/agate-dbf								\
						$(install_dir)/.build/agate-excel							\
						$(install_dir)/.build/agate-sql								\
						$(install_dir)/.build/xlrd								\
						$(script_dir)/components/python/$(csvkit_v).tar.gz
	@$(call pipmk,csvkit,$(csvkit_v),$(install_dir),$(script_dir))

$(install_dir)/.build/dask:			$(install_dir)/.build/cloudpickle							\
						$(install_dir)/.build/fsspec								\
						$(install_dir)/.build/partd								\
						$(install_dir)/.build/toolz								\
						$(script_dir)/components/python/$(dask_v).tar.gz
	@$(call pipmk,dask,$(dask_v),$(install_dir),$(script_dir))

$(install_dir)/.build/py-raft:			$(script_dir)/components/python/$(py-raft_v).tar.gz
	@$(call pipmk,py-raft,$(py-raft_v),$(install_dir),$(script_dir))

$(install_dir)/.build/raft:			$(script_dir)/components/python/$(raft_v).tar.gz
	@$(call pipmk,raft,$(raft_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyakka:			$(install_dir)/.build/asyncio								\
						$(script_dir)/components/python/$(pyakka_v).tar.gz
	@$(call pipmk,pyakka,$(pyakka_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pykka-injector:		$(install_dir)/.build/injector								\
						$(script_dir)/components/python/$(pykka-injector_v).tar.gz
	@$(call pipmk,pykka-injector,$(pykka-injector_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pykka:			$(script_dir)/components/python/$(pykka_v).tar.gz
	@$(call pipmk,pykka,$(pykka_v),$(install_dir),$(script_dir))

$(install_dir)/.build/rules-engine:		$(script_dir)/components/python/$(rules-engine_v).tar.gz
	@$(call pipmk,rules-engine,$(rules-engine_v),$(install_dir),$(script_dir))

$(install_dir)/.build/scheduler:		$(install_dir)/.build/typeguard								\
						$(script_dir)/components/python/$(scheduler_v).tar.gz
	@$(call pipmk,scheduler,$(scheduler_v),$(install_dir),$(script_dir))

$(install_dir)/.build/spreadsheet-tools:	$(install_dir)/.build/pyqt5								\
						$(install_dir)/.build/pyqt5_sip								\
						$(install_dir)/.build/openpyxl								\
						$(script_dir)/components/python/$(spreadsheet-tools_v).tar.gz
	@$(call pipmk,spreadsheet-tools,$(spreadsheet-tools_v),$(install_dir),$(script_dir))

$(install_dir)/.build/clang_format:		$(script_dir)/components/python/$(clang_format_v).tar.gz
	@$(call pipmk,clang_format,$(clang_format_v),$(install_dir),$(script_dir))

$(install_dir)/.build/scikit-learn-py:		$(install_dir)/.build/joblib								\
						$(install_dir)/.build/threadpoolctl							\
						$(script_dir)/components/libraries/$(scikit-learn-py_v).tar.gz
	@$(call pipmk,scikit-learn-py,$(scikit-learn-py_v),$(install_dir),$(script_dir))

$(install_dir)/.build/keras:			$(install_dir)/.build/optree								\
						$(install_dir)/.build/namex								\
						$(script_dir)/components/python/$(keras_v).tar.gz
	@$(call pipmk,keras,$(keras_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyinfo:			$(script_dir)/components/python/$(pyinfo_v).tar.gz
	@$(call pipmk,pyinfo,$(pyinfo_v),$(install_dir),$(script_dir))

$(install_dir)/.build/wheel:			$(script_dir)/components/python/$(wheel_v).tar.gz
	@$(call pipmk,wheel,$(wheel_v),$(install_dir),$(script_dir))

$(install_dir)/.build/rsa:			$(script_dir)/components/python/$(rsa_v).tar.gz
	@$(call pipmk,rsa,$(rsa_v),$(install_dir),$(script_dir))

$(install_dir)/.build/rsa_python:		$(script_dir)/components/python/$(rsa_python_v).tar.gz
	@$(call pipmk,rsa_python,$(rsa_python_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyasn:			$(script_dir)/components/python/$(pyasn_v).tar.gz
	@$(call pipmk,pyasn,$(pyasn_v),$(install_dir),$(script_dir))

$(install_dir)/.build/brotli-py:		$(script_dir)/components/python/$(brotli-py_v).tar.gz
	@$(call pipmk,brotli-py,$(brotli-py_v),$(install_dir),$(script_dir))

$(install_dir)/.build/typing_inspection:	$(script_dir)/components/python/$(typing_inspection_v).tar.gz
	@$(call pipmk,typing_inspection,$(typing_inspection_v),$(install_dir),$(script_dir))

$(install_dir)/.build/fastapi:			$(script_dir)/components/python/$(fastapi_v).tar.gz
	@$(call pipmk,fastapi,$(fastapi_v),$(install_dir),$(script_dir))

$(install_dir)/.build/python_multipart:		$(script_dir)/components/python/$(python_multipart_v).tar.gz
	@$(call pipmk,python_multipart,$(python_multipart_v),$(install_dir),$(script_dir))

$(install_dir)/.build/python_jose:		$(script_dir)/components/python/$(python_jose_v).tar.gz
	@$(call pipmk,python_jose,$(python_jose_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pydantic_core:		$(script_dir)/components/python/$(pydantic_core_v).tar.gz
	@$(call pipmk,pydantic_core,$(pydantic_core_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pydantic:			$(script_dir)/components/python/$(pydantic_v).tar.gz
	@$(call pipmk,pydantic,$(pydantic_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyasn1:			$(script_dir)/components/python/$(pyasn1_v).tar.gz
	@$(call pipmk,pyasn1,$(pyasn1_v),$(install_dir),$(script_dir))

$(install_dir)/.build/passlib:			$(script_dir)/components/python/$(passlib_v).tar.gz
	@$(call pipmk,passlib,$(passlib_v),$(install_dir),$(script_dir))

$(install_dir)/.build/h11:			$(script_dir)/components/python/$(h11_v).tar.gz
	@$(call pipmk,h11,$(h11_v),$(install_dir),$(script_dir))

$(install_dir)/.build/greenlet:			$(script_dir)/components/python/$(greenlet_v).tar.gz
	@$(call pipmk,greenlet,$(greenlet_v),$(install_dir),$(script_dir))

$(install_dir)/.build/sqlalchemy:		$(script_dir)/components/python/$(sqlalchemy_v).tar.gz
	@$(call pipmk,sqlalchemy,$(sqlalchemy_v),$(install_dir),$(script_dir))

$(install_dir)/.build/starlette:		$(script_dir)/components/python/$(starlette_v).tar.gz
	@$(call pipmk,starlette,$(starlette_v),$(install_dir),$(script_dir))

$(install_dir)/.build/uvicorn:		$(script_dir)/components/python/$(uvicorn_v).tar.gz
	@$(call pipmk,uvicorn,$(uvicorn_v),$(install_dir),$(script_dir))

$(install_dir)/.build/brotli-asgi:		$(script_dir)/components/python/$(brotli-asgi_v).tar.gz
	@$(call pipmk,brotli-asgi,$(brotli-asgi_v),$(install_dir),$(script_dir))

$(install_dir)/.build/tenacity:			$(script_dir)/components/python/$(tenacity_v).tar.gz
	@$(call pipmk,tenacity,$(tenacity_v),$(install_dir),$(script_dir))

$(install_dir)/.build/hvac:			$(script_dir)/components/python/$(hvac_v).tar.gz
	@$(call pipmk,hvac,$(hvac_v),$(install_dir),$(script_dir))

$(install_dir)/.build/setproctitle:		$(script_dir)/components/python/$(setproctitle_v).tar.gz
	@$(call pipmk,setproctitle,$(setproctitle_v),$(install_dir),$(script_dir))

$(install_dir)/.build/tornado:			$(script_dir)/components/python/$(tornado_v).tar.gz
	@$(call pipmk,tornado,$(tornado_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyzmq:			$(script_dir)/components/python/$(pyzmq_v).tar.gz
	@$(call pipmk,pyzmq,$(pyzmq_v),$(install_dir),$(script_dir))

$(install_dir)/.build/trove_classifiers:	$(script_dir)/components/python/$(trove_classifiers_v).tar.gz
	@$(call pipmk,trove_classifiers,$(trove_classifiers_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pluggy:			$(script_dir)/components/python/$(pluggy_v).tar.gz
	@$(call pipmk,pluggy,$(pluggy_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pathspec:			$(script_dir)/components/python/$(pathspec_v).tar.gz
	@$(call pipmk,pathspec,$(pathspec_v),$(install_dir),$(script_dir))

$(install_dir)/.build/traitlets:		$(script_dir)/components/python/$(traitlets_v).tar.gz
	@$(call pipmk,traitlets,$(traitlets_v),$(install_dir),$(script_dir))

$(install_dir)/.build/charset_normalizer:	$(script_dir)/components/python/$(charset_normalizer_v).tar.gz
	@$(call pipmk,charset_normalizer,$(charset_normalizer_v),$(install_dir),$(script_dir))

$(install_dir)/.build/ecdsa:			$(script_dir)/components/python/$(ecdsa_v).tar.gz
	@$(call pipmk,ecdsa,$(ecdsa_v),$(install_dir),$(script_dir))

$(install_dir)/.build/click:			$(script_dir)/components/python/$(click_v).tar.gz
	@$(call pipmk,click,$(click_v),$(install_dir),$(script_dir))

$(install_dir)/.build/bcrypt:			$(install_dir)/.build/rust								\
						$(script_dir)/components/python/$(bcrypt_v).tar.gz
	@$(call pipmk,bcrypt,$(bcrypt_v),$(install_dir),$(script_dir))

$(install_dir)/.build/tabulate:			$(script_dir)/components/python/$(tabulate_v).tar.gz
	@$(call pipmk,tabulate,$(tabulate_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pandas:			$(script_dir)/components/python/$(pandas_v).tar.gz
	@$(call pipmk,pandas,$(pandas_v),$(install_dir),$(script_dir))

$(install_dir)/.build/tzdata:			$(script_dir)/components/python/$(tzdata_v).tar.gz
	@$(call pipmk,tzdata,$(tzdata_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pytz:			$(script_dir)/components/python/$(pytz_v).tar.gz
	@$(call pipmk,pytz,$(pytz_v),$(install_dir),$(script_dir))

$(install_dir)/.build/annotated_types:		$(script_dir)/components/python/$(annotated_types_v).tar.gz
	@$(call pipmk,annotated_types,$(annotated_types_v),$(install_dir),$(script_dir))

$(install_dir)/.build/requests:			$(script_dir)/components/python/$(requests_v).tar.gz
	@$(call pipmk,requests,$(requests_v),$(install_dir),$(script_dir))

$(install_dir)/.build/jmespath:			$(script_dir)/components/python/$(jmespath_v).tar.gz
	@$(call pipmk,jmespath,$(jmespath_v),$(install_dir),$(script_dir))

$(install_dir)/.build/s3transfer:		$(script_dir)/components/python/$(s3transfer_v).tar.gz
	@$(call pipmk,s3transfer,$(s3transfer_v),$(install_dir),$(script_dir))

$(install_dir)/.build/botocore:			$(script_dir)/components/python/$(botocore_v).tar.gz
	@$(call pipmk,botocore,$(botocore_v),$(install_dir),$(script_dir))

$(install_dir)/.build/boto3:			$(script_dir)/components/python/$(boto3_v).tar.gz
	@$(call pipmk,boto3,$(boto3_v),$(install_dir),$(script_dir))

$(install_dir)/.build/urllib3:			$(script_dir)/components/python/$(urllib3_v).tar.gz
	@$(call pipmk,urllib3,$(urllib3_v),$(install_dir),$(script_dir))

$(install_dir)/.build/certifi:			$(script_dir)/components/python/$(certifi_v).tar.gz
	@$(call pipmk,certifi,$(certifi_v),$(install_dir),$(script_dir))

$(install_dir)/.build/psycopg2:			$(install_dir)/.build/postgresql							\
						$(script_dir)/components/python/$(psycopg2_v).tar.gz
	@$(call pipmk,psycopg2,$(psycopg2_v),$(install_dir),$(script_dir))

#$(install_dir)/.build/imagecodecs:		$(install_dir)/.build/libdeflate							\
#						$(install_dir)/.build/openjpeg								\
#						$(install_dir)/.build/jxrlib								\
#						$(script_dir)/components/python/$(imagecodecs_v).tar.gz
#	@$(call pipmk,imagecodecs,$(imagecodecs_v),$(install_dir),$(script_dir))

$(install_dir)/.build/cvxopt:			$(install_dir)/.build/openblas								\
						$(install_dir)/.build/lapack								\
						$(script_dir)/components/python/$(cvxopt_v).tar.gz
	@$(call pipmk,cvxopt,$(cvxopt_v),$(install_dir),$(script_dir))

$(install_dir)/.build/colorama:			$(script_dir)/components/python/$(colorama_v).tar.gz
	@$(call pipmk,colorama,$(colorama_v),$(install_dir),$(script_dir))

$(install_dir)/.build/chardet:			$(script_dir)/components/python/$(chardet_v).tar.gz
	@$(call pipmk,chardet,$(chardet_v),$(install_dir),$(script_dir))

$(install_dir)/.build/contourpy:		$(script_dir)/components/python/contourpy-1.3.3.tar.gz
	@$(call pipmk,contourpy,contourpy-1.3.3,$(install_dir),$(script_dir))

$(install_dir)/.build/cycler:			$(script_dir)/components/python/cycler-0.12.1.tar.gz
	@$(call pipmk,cycler,cycler-0.12.1,$(install_dir),$(script_dir))

$(install_dir)/.build/fonttools:		$(script_dir)/components/python/fonttools-4.59.1.tar.gz
	@$(call pipmk,fonttools,fonttools-4.59.1,$(install_dir),$(script_dir))

$(install_dir)/.build/kiwisolver:		$(script_dir)/components/python/kiwisolver-1.4.9.tar.gz
	@$(call pipmk,kiwisolver,kiwisolver-1.4.9,$(install_dir),$(script_dir))

$(install_dir)/.build/pyparsing:		$(script_dir)/components/python/pyparsing-3.2.3.tar.gz
	@$(call pipmk,pyparsing,pyparsing-3.2.3,$(install_dir),$(script_dir))

$(install_dir)/.build/pyparsing_ext:		$(script_dir)/components/python/pyparsing_ext-1.1.1.tar.gz
	@$(call pipmk,pyparsing_ext,pyparsing_ext-1.1.1,$(install_dir),$(script_dir))

$(install_dir)/.build/matplotlib:		$(install_dir)/.build/meson 								\
						$(install_dir)/.build/pybind11								\
						$(install_dir)/.build/ninja								\
						$(install_dir)/.build/freetype								\
						$(install_dir)/.build/qhull								\
						$(install_dir)/.build/contourpy								\
						$(install_dir)/.build/cycler								\
						$(install_dir)/.build/fonttools								\
						$(install_dir)/.build/kiwisolver							\
						$(install_dir)/.build/pyparsing								\
						$(install_dir)/.build/pyparsing_ext							\
						$(script_dir)/components/python/$(matplotlib_v).tar.gz 
	@$(call pipmk,matplotlib,$(matplotlib_v),$(install_dir),$(script_dir))

$(install_dir)/.build/jsonschema:		$(install_dir)/.build/rpds-py								\
						$(install_dir)/.build/referencing 							\
						$(install_dir)/.build/jsonschema-specifications						\
						$(script_dir)/components/python/$(jsonschema_v).tar.gz
	@$(call pipmk,jsonschema,$(jsonschema_v),$(install_dir),$(script_dir))

$(install_dir)/.build/jsonschema-specifications:	$(script_dir)/components/python/$(jsonschema-specifications_v).tar.gz
	@$(call pipmk,jsonschema-specifications,$(jsonschema-specifications_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pdflatex:			$(install_dir)/.build/attrs	 							\
						$(script_dir)/components/python/$(pdflatex_v).tar.gz
	@$(call pipmk,pdflatex,$(pdflatex_v),$(install_dir),$(script_dir))

$(install_dir)/.build/cachetools:		$(script_dir)/components/python/$(cachetools_v).tar.gz
	@$(call pipmk,cachetools,$(cachetools_v),$(install_dir),$(script_dir))

$(install_dir)/.build/ply:			$(script_dir)/components/python/$(ply_v).tar.gz
	@$(call pipmk,ply,$(ply_v),$(install_dir),$(script_dir))

$(install_dir)/.build/markupsafe:		$(install_dir)/.build/python3								\
						$(install_dir)/.build/setuptools							\
						$(script_dir)/components/python/$(markupsafe_v).tar.gz
	@$(call pipmk,markupsafe,$(markupsafe_v),$(install_dir),$(script_dir))

$(install_dir)/.build/mako:			$(script_dir)/components/python/$(mako_v).tar.gz
	@$(call pipmk,mako,$(mako_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pango-py:			$(script_dir)/components/python/$(pango-py_v).tar.gz
	@$(call pipmk,pango-py,$(pango-py_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pillow:			$(install_dir)/.build/libjpeg-turbo							\
						$(script_dir)/components/python/$(pillow_v).tar.gz
	@$(call pipmk,pillow,$(pillow_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pycparser:		$(script_dir)/components/python/$(pycparser_v).tar.gz
	@$(call pipmk,pycparser,$(pycparser_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pyyaml:			$(script_dir)/components/python/$(pyyaml_v).tar.gz
	@$(call pipmk,pyyaml,$(pyyaml_v),$(install_dir),$(script_dir))

$(install_dir)/.build/typing_extensions:	$(script_dir)/components/python/$(typing_extensions_v).tar.gz
	@$(call pipmk,typing_extensions,$(typing_extensions_v),$(install_dir),$(script_dir))

$(install_dir)/.build/jinja2:			$(script_dir)/components/python/$(jinja2_v).tar.gz
	@$(call pipmk,jinja2,$(jinja2_v),$(install_dir),$(script_dir))

$(install_dir)/.build/referencing:		$(install_dir)/.build/typing_extensions							\
						$(script_dir)/components/python/$(referencing_v).tar.gz
	@$(call pipmk,referencing,$(referencing_v),$(install_dir),$(script_dir))

$(install_dir)/.build/docutils:			$(script_dir)/components/python/$(docutils_v).tar.gz
	@$(call pipmk,docutils,$(docutils_v),$(install_dir),$(script_dir))

$(install_dir)/.build/meson:			$(install_dir)/.build/setuptools  							\
						$(install_dir)/.build/packaging								\
						$(install_dir)/.build/setuptools_scm							\
						$(script_dir)/components/python/$(meson_v).tar.gz
	@$(call pipmk,meson,$(meson_v),$(install_dir),$(script_dir))

$(install_dir)/.build/rpds-py:			$(install_dir)/.build/python3								\
						$(script_dir)/components/python/$(rpds-py_v).tar.gz
	@$(call pipmk,rpds-py,$(rpds-py_v),$(install_dir),$(script_dir))

$(install_dir)/.build/cython:			$(script_dir)/components/python/$(cython_v).tar.gz
	@$(call pipmk,cython,$(cython_v),$(install_dir),$(script_dir))

$(install_dir)/.build/packaging:		$(script_dir)/components/python/$(packaging_v).tar.gz
	@$(call pipmk,packaging,$(packaging_v),$(install_dir),$(script_dir))

$(install_dir)/.build/hatchling:		$(script_dir)/components/python/$(hatchling_v).tar.gz
	@$(call pipmk,hatchling,$(hatchling_v),$(install_dir),$(script_dir))

$(install_dir)/.build/jupyter_core:		$(script_dir)/components/python/$(jupyter_core_v).tar.gz
	@$(call pipmk,jupyter_core,$(jupyter_core_v),$(install_dir),$(script_dir))

$(install_dir)/.build/jupyter_client:		$(script_dir)/components/python/$(jupyter_client_v).tar.gz
	@$(call pipmk,jupyter_client,$(jupyter_client_v),$(install_dir),$(script_dir))

$(install_dir)/.build/platformdirs:		$(script_dir)/components/python/$(platformdirs_v).tar.gz
	@$(call pipmk,platformdirs,$(platformdirs_v),$(install_dir),$(script_dir))

$(install_dir)/.build/attrs:			$(install_dir)/.build/python3								\
						$(install_dir)/.build/attrs18								\
						$(script_dir)/components/python/$(attrs_v).tar.gz
	@$(call pipmk,attrs,$(attrs_v),$(install_dir),$(script_dir))

$(install_dir)/.build/setuptools:		$(install_dir)/.build/coherent_licensed							\
						$(script_dir)/components/python/$(setuptools_v).tar.gz
	@$(call pipmk,setuptools,$(setuptools_v),$(install_dir),$(script_dir))

$(install_dir)/.build/setuptools_scm:		$(script_dir)/components/python/$(setuptools_scm_v).tar.gz
	@$(call pipmk,setuptools_scm,$(setuptools_scm_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pythran:			$(script_dir)/components/python/$(pythran_v).tar.gz
	@$(call pipmk,pythran,$(pythran_v),$(install_dir),$(script_dir))

$(install_dir)/.build/pybind11:			$(script_dir)/components/python/$(pybind11_v).tar.gz
	@$(call pipmk,pybind11,$(pybind11_v),$(install_dir),$(script_dir))

$(install_dir)/.build/gast:			$(script_dir)/components/python/$(gast_v).tar.gz
	@$(call pipmk,gast,$(gast_v),$(install_dir),$(script_dir))

$(install_dir)/.build/beniget:			$(script_dir)/components/python/$(beniget_v).tar.gz
	@$(call pipmk,beniget,$(beniget_v),$(install_dir),$(script_dir))

$(install_dir)/.build/features:			$(install_dir)/.build/concepts								\
						$(install_dir)/.build/fileconfig 							\
						$(install_dir)/.build/bitsets								\
						$(install_dir)/.build/graphviz-py							\
						$(script_dir)/components/python/$(features_v).tar.gz
	@$(call pipmk,features,$(features_v),$(install_dir),$(script_dir))

$(install_dir)/.build/concepts:			$(script_dir)/components/python/$(concepts_v).tar.gz
	@$(call pipmk,concepts,$(concepts_v),$(install_dir),$(script_dir))

$(install_dir)/.build/fileconfig:		$(script_dir)/components/python/$(fileconfig_v).tar.gz
	@$(call pipmk,fileconfig,$(fileconfig_v),$(install_dir),$(script_dir))

$(install_dir)/.build/bitsets:			$(script_dir)/components/python/$(bitsets_v).tar.gz
	@$(call pipmk,bitsets,$(bitsets_v),$(install_dir),$(script_dir))

$(install_dir)/.build/graphviz-py:		$(script_dir)/components/python/$(graphviz_v).tar.gz
	@$(call pipmk,graphviz-py,$(graphviz_v),$(install_dir),$(script_dir))

$(install_dir)/.build/igraph-py:		$(install_dir)/.build/igraph 								\
						$(install_dir)/.build/texttable								\
						$(script_dir)/components/python/$(igraph-py_v).tar.gz
	@$(call pipmk,igraph-py,$(igraph-py_v),$(install_dir),$(script_dir))

$(install_dir)/.build/texttable:		$(install_dir)/.build/igraph 								\
						$(script_dir)/components/python/$(texttable_v).tar.gz
	@$(call pipmk,texttable,$(texttable_v),$(install_dir),$(script_dir))

$(install_dir)/.build/scipy:			$(install_dir)/.build/pybind11 								\
						$(install_dir)/.build/pythran 								\
						$(install_dir)/.build/gast								\
						$(install_dir)/.build/beniget								\
						$(install_dir)/.build/numpy
	@$(call pipmk,scipy,$(scipy_v),$(install_dir),$(script_dir))

$(install_dir)/.build/numpy:			$(install_dir)/.build/openblas								\
						$(install_dir)/.build/features
	@$(call pipmk,numpy,$(numpy_v),$(install_dir),$(script_dir))

#---------------------------------------------------------------------------------------------------------------------------------------
# Rust
#
$(install_dir)/.build/bindgen-cli:		$(script_dir)/components/rust/$(bindgen-cli_v).tar.gz
	@generic_build.sh bindgen-cli $(bindgen-cli_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/bindgen-cli

$(install_dir)/.build/cbindgen:			$(script_dir)/components/rust/$(cbindgen_v).tar.gz
	@cargo install --force cbindgen
	@touch $(install_dir)/.build/cbindgen

$(install_dir)/.build/openssl-probe:		$(script_dir)/components/rust/$(openssl-probe_v).tar.gz
	@stage.sh openssl-probe $(openssl-probe_v)  $(install_dir) $(script_dir) 
	@pushd $(openssl-probe_v) && cargo build --release && popd
	@rm -rf *
	@touch $(install_dir)/.build/openssl-probe

$(install_dir)/.build/libc:		$(script_dir)/components/rust/$(libc_v).tar.gz
	@stage.sh libc $(libc_v)  $(install_dir) $(script_dir)
	@pushd $(libc_v) && cargo build --release && popd
	@rm -rf *
	@touch $(install_dir)/.build/libc

$(install_dir)/.build/getrandom:		$(script_dir)/components/rust/$(getrandom_v).tar.gz
	@stage.sh getrandom $(getrandom_v)  $(install_dir) $(script_dir)
	@pushd $(getrandom_v) && cargo build --release && popd
	@rm -rf *
	@touch $(install_dir)/.build/getrandom

$(install_dir)/.build/parking_lot-core:		$(script_dir)/components/rust/$(parking_lot-core_v).tar.gz
	@stage.sh parking_lot-core $(parking_lot-core_v)  $(install_dir) $(script_dir)
	@pushd $(parking_lot-core_v) && cargo build --release && popd
	@rm -rf *
	@touch $(install_dir)/.build/parking_lot-core

$(install_dir)/.build/socket2:		$(script_dir)/components/rust/$(socket2_v).tar.gz
	@stage.sh socket2 $(socket2_v)  $(install_dir) $(script_dir) 
	@pushd $(socket2_v) && cargo build --release --target aarch64-unknown-linux-gnu && popd
	@rm -rf *
	@touch $(install_dir)/.build/socket2

$(install_dir)/.build/rustls_pemfile:		$(script_dir)/components/rust/$(rustls-pemfile_v).tar.gz
	@stage.sh rustls_pemfile $(rustls-pemfile_v)  $(install_dir) $(script_dir)
	@pushd $(rustls-pemfile_v) && cargo build --release && popd
	@rm -rf *
	@touch $(install_dir)/.build/rustls_pemfile

$(install_dir)/.build/atty:			$(script_dir)/components/rust/$(atty_v).tar.gz
	@stage.sh atty $(atty_v)  $(install_dir) $(script_dir)
	@pushd $(atty_v) && cargo build --release && popd
	@rm -rf *
	@touch $(install_dir)/.build/atty

$(install_dir)/.build/rustls-native-certs:	$(install_dir)/.build/rustls_pemfile							\
						$(script_dir)/components/rust/$(rustls-native-certs_v).tar.gz
	@stage.sh rustls-native-certs $(rustls-native-certs_v)  $(install_dir) $(script_dir)
	@pushd $(rustls-native-certs_v) && cargo build --release && popd
	@rm -rf *
	@touch $(install_dir)/.build/rustls-native-certs

$(install_dir)/.build/syn:			$(script_dir)/components/rust/$(syn_v).tar.gz
	@generic_build.sh syn $(syn_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/syn

#---------------------------------------------------------------------------------------------------------------------------------------
# Erlang/Elixir
#
$(install_dir)/.build/elixir:			$(script_dir)/components/languages/elixir-main-latest.tar.gz
	@stage.sh elixir elixir-main-latest $(install_dir) $(script_dir)
	@pushd elixir-main-latest && make V=1 PREFIX=$(install_dir) install && popd && rm -rf *
	@touch $(install_dir)/.build/elixir

$(install_dir)/.build/rebar:			$(script_dir)/components/erlang/$(rebar_v).tar.gz
	@stage.sh rebar $(rebar_v) $(install_dir) $(script_dir) 
	@pushd $(rebar_v) && ./bootstrap && cp rebar3 $(install_dir)/bin/. && popd && rm -rf *
	@touch $(install_dir)/.build/rebar

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/.build/openssl:			$(install_dir)/.build/perl 								\
						$(script_dir)/components/utilities/$(openssl_v).tar.gz
	@generic_build.sh openssl $(openssl_v) $(install_dir) $(script_dir) --openssldir=$(install_dir)/etc/ssl --libdir=lib shared  zlib-dynamic
	@touch $(install_dir)/.build/openssl

$(install_dir)/.build/ocaml-num:		$(install_dir)/.build/ocaml								\
						$(install_dir)/.build/ocaml-find
	@generic_build.sh ocaml-num num-1.6 $(install_dir) $(script_dir) PROFILE=release	
	@touch $(install_dir)/.build/ocaml-num

$(install_dir)/.build/ocaml-find:		$(install_dir)/.build/ocaml
	@stage.sh ocaml-find $(ocaml-find_v)  $(install_dir) $(script_dir) 
	@pushd $(ocaml-find_v) ; ./configure -bindir $(install_dir)/bin  ; popd
	@pushd $(ocaml-find_v) ; make  V=1 all && make  V=1 install && popd
	@rm -rf *
	@touch $(install_dir)/.build/ocaml-find

$(install_dir)/.build/ocaml:		
	@stage.sh ocaml $(ocaml_v) $(install_dir) $(script_dir) 
	@pushd $(ocaml_v) ; ./configure --prefix $(install_dir)  ; popd
	@pushd $(ocaml_v) ; make  V=1 coldstart && make V=1  && make  V=1 install && popd
	@rm -rf *
	@touch $(install_dir)/.build/ocaml

$(install_dir)/.build/jogl:		
	@mkdir -p $(install_dir)/lib/java
	@cp $(script_dir)/components/java/*.jar $(install_dir)/lib/java/.
	@stage.sh jogl jogl $(install_dir) $(script_dir) 
	@pushd jogl/jogl/make && ant -Dtarget.sourcelevel=1.8 -Dtarget.targetlevel=1.8 -Dtarget.rt.jar=../rt.jar && popd
#	@touch $(install_dir)/.build/jogl

$(install_dir)/.build/eigen:			$(script_dir)/components/libraries/eigen-3.4.0.tar.gz
	@generic_build.sh eigen eigen-3.4.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/eigen

$(install_dir)/.build/rapidjson:		$(script_dir)/components/libraries/rapidjson-1.1.0.tar.gz
	@$(if $(os_linux),CXXFLAGS="$(CXXFLAGS) -Wno-class-memaccess",CXXFLAGS="$(CXXFLAGS) -Wno-format -Wno-suggest-override -Wno-suggest-destructor-override -Wno-shadow -Wno-deprecated-declarations -Wno-zero-as-null-pointer-constant") linux.sh -eneric_build.sh rapidjson rapidjson-1.1.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/rapidjson

$(install_dir)/.build/fftw:			$(script_dir)/components/libraries/fftw-3.3.10.tar.gz
	@generic_build.sh fftw fftw-3.3.10 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/fftw

$(install_dir)/.build/arpack-ng:		$(script_dir)/components/libraries/arpack-ng-3.9.1.tar.gz
	@generic_build.sh rapidjson arpack-ng-3.9.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/arpack-ng

$(install_dir)/.build/matio:			$(install_dir)/.build/hdf5-p2								\
						$(script_dir)/components/libraries/matio-1.5.28.tar.gz
	@generic_build.sh matio matio-1.5.28 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/matio

$(install_dir)/.build/scilab:														\
						$(install_dir)/.build/ant								\
						$(install_dir)/.build/clang_format							\
						$(install_dir)/.build/fftw								\
						$(install_dir)/.build/eigen								\
						$(install_dir)/.build/rapidjson								\
						$(install_dir)/.build/arpack-ng								\
						$(install_dir)/.build/pcre3								\
						$(install_dir)/.build/matio								\
						$(install_dir)/.build/ocaml								\
						$(install_dir)/.build/ocaml-num
	@cp $(script_dir)/components/java/*.jar $(install_dir)/lib/.
	@LDFLAGS="$(LDFLAGS) -L$(binaries)" 												\
		generic_build.sh scilab $(scilab_v) $(install_dir) $(script_dir) 							\
						--with-eigen-include=$(install_dir)/include/eigen3 					\
						--with-hdf5-includ=$(install_dir)/include						\
						--with-tcl-include=$(install_dir)/include 						\
						--with-tcl-library=$(install_dir)/lib							\
						--enable-build-help=no									\
						--without-gui										\
						--without-tk
	@rm -rf *
	@touch $(install_dir)/.build/scilab

$(install_dir)/.build/ant:			
	@stage.sh ant apache-ant-1.10.15 $(install_dir) $(script_dir) 
	@export JAVA_HOME=$(install_dir) && pushd apache-ant-1.10.15 && ./build.sh && popd
	@cp -aRv apache-ant-1.10.15/dist/* $(install_dir)/
	@rm -rf *
	@touch $(install_dir)/.build/ant

$(install_dir)/.build/scikit-learn:		$(script_dir)/components/libraries/$(scikit-learn_v).tar.gz
	@generic_build.sh scikit-learn $(scikit-learn_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/scikit-learn

$(install_dir)/.build/redis:			$(script_dir)/components/services/redis-stable.tar.gz
	@generic_build.sh redis redis-stable $(install_dir) $(script_dir) BUILD_TLS=yes PREFIX=$(install_dir)
	@touch $(install_dir)/.build/redis

$(install_dir)/.build/perl:			$(install_dir)/.build/bzip2								\
						$(install_dir)/.build/zlib								\
						$(script_dir)/components/languages/perl-5.40.1.tar.gz
	@generic_build.sh perl perl-5.40.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/perl

$(install_dir)/.build/patch:			
	@generic_build.sh patch patch-2.8 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/patch

$(install_dir)/.build/ncurses:			$(script_dir)/components/libraries/ncurses-6.4.tar.gz
	@generic_build.sh ncurses ncurses-6.4 $(install_dir) $(script_dir)  --with-pthread --enable-reentrant --enable-pc-files --with-pkg-config=$(install_dir)/bin/pkgconf --with-pkg-config-libdir=$(install_dir)/lib/pkgconfig
	@touch $(install_dir)/.build/ncurses
	
$(install_dir)/.build/readline:			
	@generic_build.sh readline readline-8.1.2 $(install_dir) $(script_dir) --with-curses --disable-static
	@touch $(install_dir)/.build/readline

$(install_dir)/.build/unzip:			$(script_dir)/components/libraries/unzip60.tar.gz
	@linux.sh generic_build.sh unzip unzip60 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/unzip

$(install_dir)/.build/zip:			$(script_dir)/components/libraries/zip30.tar.gz
	@linux.sh generic_build.sh zip zip30 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/zip

$(install_dir)/.build/libdeflate:		$(script_dir)/components/libraries/libdeflate-1.24.tar.gz
	@generic_build.sh libdeflate libdeflate-1.24 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libdeflate

$(install_dir)/.build/libzip:			
	@generic_build.sh libzip $(libzip_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libzip

$(install_dir)/.build/openjpeg:			$(install_dir)/.build/cmake								\
						$(script_dir)/components/libraries/openjpeg-2.5.3.tar.gz
	@generic_build.sh openjpeg openjpeg-2.5.3 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/openjpeg

$(install_dir)/.build/jxrlib:			
	@generic_build.sh jxrlib jxrlib $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/jxrlib

$(install_dir)/.build/gzip:			$(script_dir)/components/libraries/gzip-1.13.tar.gz
	@generic_build.sh gzip gzip-1.13 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/gzip

$(install_dir)/.build/lz4:			$(script_dir)/components/libraries/lz4-1.10.0.tar.gz
	@generic_build.sh lz4 lz4-1.10.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/lz4

$(install_dir)/.build/zstd:			$(script_dir)/components/libraries/zstd-1.5.6.tar.gz
	@generic_build.sh zstd zstd-1.5.6 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/zstd

$(install_dir)/.build/xz:			$(script_dir)/components/libraries/xz-5.6.2.tar.gz
	@generic_build.sh xz xz-5.6.2 $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/xz

$(install_dir)/.build/zlib:			$(script_dir)/components/libraries/zlib-1.3.1.tar.gz
	@generic_build.sh zlib zlib-1.3.1 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/zlib

$(install_dir)/.build/bzip2:			$(install_dir)/.build/diffutils								\
						$(script_dir)/components/libraries/bzip2-1.0.8.tar.gz
	@generic_build.sh bzip2 bzip2-1.0.8 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/bzip2

$(install_dir)/.build/pkgconf:			
	@generic_build.sh pkgconf pkg-config-0.29.1 $(install_dir) $(script_dir) --disable-debug --disable-host-tool --with-internal-glib
	@touch $(install_dir)/.build/pkgconf

$(install_dir)/.build/binutils:			$(install_dir)/.build/zlib $(script_dir)/components/utilities/$(binutils_v).tar.gz	
	@linux.sh generic_build.sh binutils $(binutils_v) $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --enable-ld=default --enable-plugins --enable-shared --disable-werror --enable-64-bit-bfd --enable-new-dtags --with-system-zlib --enable-default-hash-style=gnu
	@touch $(install_dir)/.build/binutils

$(install_dir)/.build/gettext:			$(install_dir)/.build/libiconv 								\
						$(script_dir)/components/libraries/$(gettext_v).tar.gz
	@generic_build.sh gettext $(gettext_v) $(install_dir) $(script_dir) --with-libiconv-prefix=$(iconv_dir)
	@touch $(install_dir)/.build/gettext

$(install_dir)/.build/libiconv:			$(script_dir)/components/libraries/$(libiconv_v).tar.gz
	@generic_build.sh libiconv $(libiconv_v) $(iconv_dir) $(script_dir) --enable-static --disable-shared
	@touch $(install_dir)/.build/libiconv

$(install_dir)/.build/bison:			$(install_dir)/.build/perl								\
						$(script_dir)/components/utilities/$(bison_v).tar.gz
	@generic_build.sh bison $(bison_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/bison

$(install_dir)/.build/make:			$(script_dir)/components/utilities/$(make_v).tar.gz
	@generic_build.sh make $(make_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/make

$(install_dir)/.build/m4:			$(script_dir)/components/utilities/$(m4_v).tar.gz
	@generic_build.sh m4 $(m4_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/m4

$(install_dir)/.build/coreutils:		$(script_dir)/components/utilities/$(coreutils_v).tar.gz
	@generic_build.sh coreutils $(coreutils_v) $(install_dir) $(script_dir) --enable-install-program=hostname
	@touch $(install_dir)/.build/coreutils

$(install_dir)/.build/flex:			$(install_dir)/.build/m4 $(script_dir)/components/utilities/$(flex_v).tar.gz
	@CFLAGS="-D_GNU_SOURCE $(CLFAGS)" generic_build.sh flex $(flex_v) $(install_dir) $(script_dir) --disable-static
	@ln -sfv flex $(install_dir)/bin/lex
	@touch $(install_dir)/.build/flex

$(install_dir)/.build/gcc:			$(if $(os_linux), $(install_dir)/.build/gcc-linux)						\
						$(if $(os_darwin), $(if $(experimental), $(install_dir)/.build/gcc-osx))			\
						$(install_dir)/.build/gcc-osx-fortran

$(install_dir)/.build/gcc-linux:		$(install_dir)/.build/flex $(install_dir)/.build/bison	
	@linux.sh generic_build.sh gcc-linux $(gcc_v) $(install_dir) $(script_dir) --disable-multilib --enable-default-pie --enable-default-ssp --enable-host-pie --disable-fixincludes --enable-languages=all
	@ln -sfv gcc $(install_dir)/bin/cc
	@touch $(install_dir)/.build/gcc-linux

$(install_dir)/.build/gcc14-linux:		$(install_dir)/.build/flex $(install_dir)/.build/bison	
	@linux.sh generic_build.sh gcc-linux $(gcc14_v) $(install_dir) $(script_dir) --disable-multilib --enable-default-pie --enable-default-ssp --enable-host-pie --disable-fixincludes --enable-languages=all
	@ln -sfv gcc $(install_dir)/bin/cc
	@touch $(install_dir)/.build/gcc14-linux

$(install_dir)/.build/gcc13-linux:		$(install_dir)/.build/flex $(install_dir)/.build/bison	
	@linux.sh generic_build.sh gcc-linux $(gcc13_v) $(install_dir) $(script_dir) --disable-multilib --enable-default-pie --enable-default-ssp --enable-host-pie --disable-fixincludes --enable-languages=all
	@ln -sfv gcc $(install_dir)/bin/cc
	@touch $(install_dir)/.build/gcc13-linux

$(install_dir)/.build/gcc15-linux:		$(install_dir)/.build/flex $(install_dir)/.build/bison	
	@linux.sh generic_build.sh gcc-linux $(gcc15_v) $(install_dir) $(script_dir) --disable-multilib --enable-default-pie --enable-default-ssp --enable-host-pie --disable-fixincludes --enable-languages=all
	@ln -sfv gcc $(install_dir)/bin/cc
	@touch $(install_dir)/.build/gcc15-linux

$(install_dir)/.build/gcc-osx:			$(install_dir)/.build/flex $(install_dir)/.build/bison 
	@generic_build.sh gcc-osx $(gcc-osx_v) $(install_dir) $(script_dir) --with-static-standard-libraries --disable-multilib --enable-languages=all --with-system-zlib --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
	@touch $(install_dir)/.build/gcc-osx

$(install_dir)/.build/gcc-osx-fortran:		$(install_dir)/.build/flex $(install_dir)/.build/bison 
	@generic_build.sh gcc-osx $(gcc-osx_v) $(install_dir) $(script_dir) --with-static-standard-libraries --disable-multilib --enable-languages=fortran --with-system-zlib --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
	@touch $(install_dir)/.build/gcc-osx-fortran

$(install_dir)/.build/pcre:			$(script_dir)/components/libraries/$(pcre_v).tar.gz
	@generic_build.sh pcre $(pcre_v) $(install_dir) $(script_dir) --enable-unicode --enable-jit --enable-pcre2-16 --enable-pcre2-32 --enable-pcre2grep-libz --enable-pcre2grep-libbz2 --enable-pcre2test-libreadline --disable-static
	@touch $(install_dir)/.build/pcre

$(install_dir)/.build/pcre3:			
	@generic_build.sh pcre3 $(pcre3_v) $(install_dir) $(script_dir) --enable-unicode --enable-jit --enable-pcre-16 --enable-pcre-32 --enable-pcregrep-libz --enable-pcregrep-libbz2 --enable-pcretest-libreadline --disable-static
	@touch $(install_dir)/.build/pcre3

$(install_dir)/.build/cmake:			$(script_dir)/components/utilities/$(cmake_v).tar.gz
	@LDFLAGS="$(LDFLAGS) -lncursesw" generic_build.sh cmake $(cmake_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/cmake

$(install_dir)/.build/libpng:			$(script_dir)/components/libraries/$(libpng_v).tar.gz
	@generic_build.sh libpng $(libpng_v) $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/libpng

$(install_dir)/.build/libtiff:			$(script_dir)/components/libraries/$(libtiff_v).tar.gz
	@generic_build.sh libtiff $(libtiff_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libtiff

$(install_dir)/.build/libffi:			$(install_dir)/.build/texinfo 								\
						$(install_dir)/.build/autoconf								\
						$(install_dir)/.build/automake								\
						$(script_dir)/components/libraries/$(libffi_v).tar.gz
	@generic_build.sh libffi $(libffi_v) $(install_dir) $(script_dir) --disable-static --with-gcc-arch=native 
	@touch $(install_dir)/.build/libffi

$(install_dir)/.build/expat:			$(script_dir)/components/libraries/$(expat_v).tar.gz
	@generic_build.sh expat $(expat_v) $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/expat

$(install_dir)/.build/python3:			$(install_dir)/.build/ncurses								\
						$(install_dir)/.build/readline								\
						$(install_dir)/.build/expat								\
						$(install_dir)/.build/bzip2								\
						$(install_dir)/.build/zlib								\
						$(install_dir)/.build/lz4								\
						$(install_dir)/.build/zstd								\
						$(install_dir)/.build/xz								\
						$(install_dir)/.build/libffi								\
						$(install_dir)/.build/nspr								\
						$(install_dir)/.build/sqlite								\
						$(install_dir)/.build/gdbm
	@generic_build.sh python3 $(python_v) $(install_dir) $(script_dir) 
	@ln -sf python3 $(install_dir)/bin/python
	@ln -sf pip3 $(install_dir)/bin/pip
	@touch $(install_dir)/.build/python3

$(install_dir)/.build/python3-p2:		$(install_dir)/.build/nspr 								\
						$(install_dir)/.build/sqlite								\
						$(install_dir)/.build/tk 								\
						$(install_dir)/.build/gdbm
	@generic_build.sh python3-p2 $(python_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/python3-p2

$(install_dir)/.build/glslang:			$(script_dir)/components/libraries/glslang-15.1.0.tar.gz
	@generic_build.sh glslang glslang-15.1.0 $(install_dir) $(script_dir) -DALLOW_EXTERNAL_SPIRV_TOOLS=true
	@touch $(install_dir)/.build/glslang

$(install_dir)/.build/re2c:			$(script_dir)/components/utilities/re2c-4.0.2.tar.gz
	@generic_build.sh re2c re2c-4.0.2 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/re2c

$(install_dir)/.build/sparsehash:		$(script_dir)/components/libraries/sparsehash-2.0.4.tar.gz
	@generic_build.sh sparsehash sparsehash-2.0.4 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/sparsehash

$(install_dir)/.build/gperf:			$(script_dir)/components/utilities/gperf-3.1.tar.gz
	@generic_build.sh gperf gperf-3.1 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/gperf

$(install_dir)/.build/googletest:		$(script_dir)/components/utilities/googletest-1.16.0.tar.gz
	@linux.sh generic_build.sh googletest googletest-1.16.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/googletest

$(install_dir)/.build/ninja:			$(install_dir)/.build/cmake								\
						$(script_dir)/components/utilities/ninja-1.12.1.tar.gz
	@generic_build.sh ninja ninja-1.12.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/ninja

$(install_dir)/.build/vulkan-headers:		$(script_dir)/components/libraries/$(vulkan-headers_v).tar.gz	
	@linux.sh generic_build.sh vulkan-headers $(vulkan-headers_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/vulkan-headers

$(install_dir)/.build/vulkan-sdk:		$(install_dir)/.build/vulkan-headers		
	@skip.sh generic_build.sh vulkan-sdk $(vulkan-sdk_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/vulkan-sdk

$(install_dir)/.build/dpc:			$(install_dir)/.build/patch	
	@generic_build.sh dpc $(dpc_v) $(install_dir)/opt/dpcpp $(script_dir) 
	@touch $(install_dir)/.build/dpc

#---------------------------------------------------------------------------------------------------------------------------------------
# LLVM should only at this time be built for linux systems as it raises hell with Clang for xcode apps
#
#
$(install_dir)/.build/llvm:			$(install_dir)/.build/cmake								\
						$(install_dir)/.build/vulkan-sdk							\
						$(install_dir)/.build/patch	
	@linux.sh generic_build.sh llvm $(llvm_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/llvm
	
$(install_dir)/.build/llvm20:			$(install_dir)/.build/vulkan-sdk							\
						$(install_dir)/.build/patch	
	@linux.sh generic_build.sh llvm $(llvm20_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/llvm20
	
$(install_dir)/.build/llvm17:			$(install_dir)/.build/vulkan-sdk							\
						$(install_dir)/.build/patch	
	@linux.sh generic_build.sh llvm $(llvm17_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/llvm20
	
$(install_dir)/.build/spirv-tools:	
	@linux.sh generic_build.sh spirv-tools $(spirv-tools_v) $(install_dir) $(script_dir) -DSPIRV-Headers_SOURCE_DIR=$(install_dir)
	@touch $(install_dir)/.build/spirv-tools

$(install_dir)/.build/spirv-llvm-translator:	
	@linux.sh generic_build.sh spirv-llvm-translator $(spirv-llvm-translator_v) $(install_dir) $(script_dir) -DSPIRV-Headers_SOURCE_DIR=$(install_dir)
	@touch $(install_dir)/.build/spirv-llvm-translator

$(install_dir)/.build/spirv-headers:	
	@linux.sh generic_build.sh spirv-headers $(spirv-headers_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/spirv-headers

$(install_dir)/.build/libunistring:		$(script_dir)/components/libraries/libunistring-1.3.tar.gz
	@generic_build.sh libunistring libunistring-1.3 $(install_dir) $(script_dir) -disable-static
	@touch $(install_dir)/.build/libunistring

$(install_dir)/.build/libidn2:			$(script_dir)/components/libraries/libidn2-2.3.8.tar.gz
	@generic_build.sh libidn2 libidn2-2.3.8 $(install_dir) $(script_dir) -disable-static --disable-doc
	@touch $(install_dir)/.build/libidn2

$(install_dir)/.build/libpsl:			$(script_dir)/components/libraries/libpsl-0.21.5.tar.gz
	@generic_build.sh libpsl libpsl-0.21.5 $(install_dir) $(script_dir) -disable-static --disable-doc --with-libiconv-prefix=$(iconv_dir)
	@touch $(install_dir)/.build/libpsl

$(install_dir)/.build/openssh:			$(script_dir)/components/utilities/openssh-9.9p2.tar.gz
	@generic_build.sh openssh openssh-9.9p2 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc/ssh --with-privsep-path=$(install_dir)/var/lib/sshd --with-default-path=$(install_dir)/usr/bin --with-superuser-path=$(install_dir)/usr/sbin:$(install_dir)/usr/bin --with-pid-dir=$(install_dir)/run   
	@touch $(install_dir)/.build/openssh

$(install_dir)/.build/libgpgerror:		$(script_dir)/components/libraries/libgpg-error-1.51.tar.gz
	@generic_build.sh libgpgerror libgpg-error-1.51 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libgpgerror

$(install_dir)/.build/libgcrypt:		$(install_dir)/.build/libgpgerror							\
						$(script_dir)/components/libraries/libgcrypt-1.11.0.tar.gz
	@generic_build.sh libgcrypt libgcrypt-1.11.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libgcrypt

$(install_dir)/.build/libssh2:			$(script_dir)/components/libraries/libssh2-1.11.1.tar.gz
	@generic_build.sh libssh2 libssh2-1.11.1 $(install_dir) $(script_dir) --disable-docker-tests --disable-static
	@touch $(install_dir)/.build/libssh2

$(install_dir)/.build/curl:			$(install_dir)/.build/libpsl 								\
						$(script_dir)/components/utilities/curl-8.12.1.tar.gz
	@generic_build.sh curl curl-8.12.1 $(install_dir) $(script_dir) --disable-static --with-openssl
	@touch $(install_dir)/.build/curl

$(install_dir)/.build/wget:			$(script_dir)/components/utilities/wget-1.24.5.tar.gz
	@generic_build.sh wget wget-1.24.5 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --with-ssl=openssl
	@touch $(install_dir)/.build/wget

$(install_dir)/.build/libtasn:			$(script_dir)/components/libraries/libtasn1-4.20.0.tar.gz
	@generic_build.sh libtasn libtasn1-4.20.0 $(install_dir) $(script_dir) --disable-static --disable-doc
	@touch $(install_dir)/.build/libtasn

$(install_dir)/.build/nss:			$(install_dir)/.build/nspr 								\
						$(install_dir)/.build/sqlite 								\
						$(install_dir)/.build/zlib 								\
						$(script_dir)/components/utilities/$(nss_v).tar.gz
	@linux.sh generic_build.sh nss $(nss_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/nss

$(install_dir)/.build/p11-kit:			$(script_dir)/components/utilities/$(p11-kit_v).tar.gz
	@trust_paths=$(install_dir)/etc/pki/anchors generic_build.sh p11-kit $(p11-kit_v) $(install_dir) $(script_dir) --localstatedir=$(install_dir)/var  $(if ($(UNAME_S),Darwin),--without-trust-paths) 
	@ln -sfv $(install_dir)/libexec/p11-kit/trust-extract-compat $(install_dir)/bin/update-ca-certificates
	@touch $(install_dir)/.build/p11-kit

$(install_dir)/.build/makeca:			$(script_dir)/components/utilities/make-ca-1.15.tar.gz $(script_dir)/components/config/certdata.txt
#	@generic_build.sh makeca make-ca-1.15 $(install_dir) $(script_dir) DESTDIR=$(install_dir) SBINDIR=/sbin MANDIR=/share/man LIBEXECDIR=/libexec/make-ca
	@install -vdm755 $(install_dir)/etc/ssl/local
	@$(script_dir)/scripts/make-ca.sh -C $(script_dir)/components/config/certdata.txt --pkidir $(install_dir)/etc/pki --ssldir $(install_dir)/etc/ssl
	@@chmod 755 $(install_dir)/etc/ssl/certs && install -m644 $(script_dir)/components/config/cacert.pem $(install_dir)/etc/ssl/certs/cacert.pem && chmod 555 $(install_dir)/etc/ssl/certs
	@touch $(install_dir)/.build/makeca

$(install_dir)/.build/sqlite:			
	@CPPFLAGS="-D SQLITE_ENABLE_COLUMN_METADATA=1 -D SQLITE_ENABLE_UNLOCK_NOTIFY=1 -D SQLITE_ENABLE_DBSTAT_VTAB=1 -D SQLITE_SECURE_DELETE=1" generic_build.sh sqlite $(sqlite_v) $(install_dir) $(script_dir) --disable-static --enable-fts{4,5} 
	@touch $(install_dir)/.build/sqlite

$(install_dir)/.build/nspr:			$(script_dir)/components/utilities/$(nspr_v).tar.gz
	@generic_build.sh nspr $(nspr_v) $(install_dir) $(script_dir)  --with-mozilla --with-pthreads --enable-64bit
	@touch $(install_dir)/.build/nspr

$(install_dir)/.build/rust:			$(install_dir)/.build/llvm								\
						$(install_dir)/.build/curl								\
						$(install_dir)/.build/gettext
	@generic_build.sh rust $(rust_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/rust

$(install_dir)/.build/libclc:			$(script_dir)/components/libraries/$(libclc_v).tar.gz
	@LLVM_DIR=$(llvm_dir) linux.sh generic_build.sh libclc $(libclc_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/libclc

$(install_dir)/.build/libdrm:			$(install_dir)/.build/libpciaccess $(script_dir)/components/libraries/$(libdrm_v).tar.gz
	@linux.sh generic_build.sh libdrm $(libdrm_v) $(install_dir) $(script_dir)  -Dintel=enabled
	@touch $(install_dir)/.build/libdrm

$(install_dir)/.build/libxml2:			$(script_dir)/components/libraries/$(libxml2_v).tar.gz
	@generic_build.sh libxml2 $(libxml2_v) $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --disable-static --with-history --with-icu
	@touch $(install_dir)/.build/libxml2

$(install_dir)/.build/libxslt:			$(script_dir)/components/libraries/$(libxslt_v).tar.gz
	@generic_build.sh libxslt $(libxslt_v) $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/libxslt					

$(install_dir)/.build/wayland:			$(install_dir)/.build/ninja								\
						$(install_dir)/.build/libxml2								\
						$(install_dir)/.build/libxslt								\
						$(script_dir)/components/libraries/$(wayland_v).tar.gz
	@linux.sh generic_build.sh wayland $(wayland_v) $(install_dir) $(script_dir) -Ddocumentation=false
	@touch $(install_dir)/.build/wayland

$(install_dir)/.build/wayland-protocols:	$(script_dir)/components/libraries/$(wayland-protocols_v).tar.gz
	@linux.sh generic_build.sh wayland-protocols $(wayland-protocols_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/wayland-protocols

$(install_dir)/.build/util-macros:		$(script_dir)/components/libraries/$(util-macros_v).tar.gz
	@linux.sh generic_build.sh util-macros $(util-macros_v) $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/util-macros

$(install_dir)/.build/xorgproto:		$(script_dir)/components/libraries/$(xorgproto_v).tar.gz
	@linux.sh generic_build.sh xorgproto $(xorgproto_v) $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/xorgproto

$(install_dir)/.build/xcb-proto:		$(script_dir)/components/libraries/$(xcb-proto_v).tar.gz
	@linux.sh generic_build.sh xcb-proto $(xcb-proto_v) $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/xcb-proto

$(install_dir)/.build/libXdmcp:			$(script_dir)/components/libraries/libXdmcp-1.1.5.tar.gz
	@linux.sh generic_build.sh libXdmcp libXdmcp-1.1.5 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXdmcp

$(install_dir)/.build/libXau:			$(script_dir)/components/libraries/libXau-1.0.11.tar.gz
	@linux.sh generic_build.sh libXau libXau-1.0.11 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXau

$(install_dir)/.build/libxcb:			$(script_dir)/components/libraries/libxcb-1.17.0.tar.gz
	@linux.sh generic_build.sh libxcb libxcb-1.17.0 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libxcb

$(install_dir)/.build/xtrans:			$(script_dir)/components/libraries/$(xtrans_v).tar.gz
	@linux.sh generic_build.sh xtrans $(xtrans_v) $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/xtrans

$(install_dir)/.build/libX11:			$(script_dir)/components/libraries/libX11-1.8.11.tar.gz
	@linux.sh generic_build.sh libX11 libX11-1.8.11 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libX11

$(install_dir)/.build/libXext:			$(script_dir)/components/libraries/libXext-1.3.6.tar.gz
	@linux.sh generic_build.sh libXext libXext-1.3.6 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXext

$(install_dir)/.build/libFS:			$(script_dir)/components/libraries/libFS-1.0.10.tar.gz
	@linux.sh generic_build.sh libFS libFS-1.0.10 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libFS

$(install_dir)/.build/libICE:			$(script_dir)/components/libraries/libICE-1.1.2.tar.gz
	@linux.sh generic_build.sh libICE libICE-1.1.2 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libICE

$(install_dir)/.build/libSM:			$(script_dir)/components/libraries/libSM-1.2.5.tar.gz
	@linux.sh generic_build.sh libSM libSM-1.2.5 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libSM

$(install_dir)/.build/libXScrnSaver:		$(script_dir)/components/libraries/libXScrnSaver-1.2.4.tar.gz
	@linux.sh generic_build.sh libXScrnSaver libXScrnSaver-1.2.4 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXScrnSaver

$(install_dir)/.build/libXt:			$(script_dir)/components/libraries/libXt-1.3.1.tar.gz
	@linux.sh generic_build.sh libXt libXt-1.3.1 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXt

$(install_dir)/.build/libXmu:			$(script_dir)/components/libraries/libXmu-1.2.1.tar.gz
	@linux.sh generic_build.sh libXmu libXmu-1.2.1 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXmu

$(install_dir)/.build/libXpm:			$(script_dir)/components/libraries/libXpm-3.5.17.tar.gz
	@linux.sh generic_build.sh libXpm libXpm-3.5.17 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXpm

$(install_dir)/.build/libXaw:			$(script_dir)/components/libraries/libXaw-1.0.16.tar.gz
	@linux.sh generic_build.sh libXaw libXaw-1.0.16 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXaw

$(install_dir)/.build/libXfixes:		$(script_dir)/components/libraries/libXfixes-6.0.1.tar.gz
	@linux.sh generic_build.sh libXfixes libXfixes-6.0.1 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXfixes

$(install_dir)/.build/libXcomposite:		$(script_dir)/components/libraries/libXcomposite-0.4.6.tar.gz
	@linux.sh generic_build.sh libXcomposite libXcomposite-0.4.6 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXcomposite

$(install_dir)/.build/libXrender:		$(script_dir)/components/libraries/libXrender-0.9.12.tar.gz
	@linux.sh generic_build.sh libXrender libXrender-0.9.12 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXrender

$(install_dir)/.build/libXcursor:		$(script_dir)/components/libraries/libXcursor-1.2.3.tar.gz
	@linux.sh generic_build.sh libXcursor libXcursor-1.2.3 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXcursor

$(install_dir)/.build/libXdamage:		$(script_dir)/components/libraries/libXdamage-1.1.6.tar.gz
	@linux.sh generic_build.sh libXdamage libXdamage-1.1.6 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXdamage

$(install_dir)/.build/freetype:			$(script_dir)/components/libraries/freetype-2.13.3.tar.gz
	@generic_build.sh freetype freetype-2.13.3 $(install_dir) $(script_dir) --disable-static --enable-freetype-config
	@touch $(install_dir)/.build/freetype

$(install_dir)/.build/freetype-pass2:		$(script_dir)/components/libraries/freetype-2.13.3.tar.gz
	@linux.sh generic_build.sh freetype-pass2 freetype-2.13.3 $(install_dir) $(script_dir) --disable-static --enable-freetype-config
	@touch $(install_dir)/.build/freetype-pass2

$(install_dir)/.build/fontconfig:		$(install_dir)/.build/gperf								\
						$(script_dir)/components/libraries/fontconfig-2.15.0.tar.gz 
	@linux.sh generic_build.sh fontconfig fontconfig-2.15.0 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-docs
	@touch $(install_dir)/.build/fontconfig

$(install_dir)/.build/harfbuzz:			$(install_dir)/.build/glib								\
						$(install_dir)/.build/icu4c								\
						$(install_dir)/.build/graphite								\
						$(script_dir)/components/libraries/harfbuzz-9.0.0.tar.gz
	@linux.sh generic_build.sh harfbuzz harfbuzz-9.0.0 $(install_dir) $(script_dir) -Dcoretext=enabled --buildtype=release -Dicu=enabled -Dgraphite2=enabled -Dintrospection=enabled
	@touch $(install_dir)/.build/harfbuzz

$(install_dir)/.build/harfbuzz-p2:		$(script_dir)/components/libraries/harfbuzz-9.0.0.tar.gz
	@linux.sh generic_build.sh harfbuzz-p2 harfbuzz-9.0.0 $(install_dir) $(script_dir)  -Dcoretext=enabled --buildtype=release -Dgraphite2=enabled -Dintrospection=enabled
	@touch $(install_dir)/.build/harfbuzz-p2

$(install_dir)/.build/graphite:			$(script_dir)/components/libraries/graphite2-1.3.14.tar.gz
	@linux.sh generic_build.sh graphite graphite2-1.3.14 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/graphite

$(install_dir)/.build/glib:			$(script_dir)/components/libraries/glib-2.84.0.tar.gz
	@CC=gcc CXX=g++ linux.sh generic_build.sh glib glib-2.84.0 $(install_dir) $(script_dir) gobject-introspection-1.82.0
	@touch $(install_dir)/.build/glib

$(install_dir)/.build/glib-osx:			$(script_dir)/components/libraries/glib-2.84.0.tar.gz
	@generic_build.sh glib-osx glib-2.84.0 $(install_dir) $(script_dir) gobject-introspection-1.82.0
	@touch $(install_dir)/.build/glib-osx

$(install_dir)/.build/libfontenc:		$(script_dir)/components/libraries/libfontenc-1.1.8.tar.gz
	@linux.sh generic_build.sh libfontenc libfontenc-1.1.8 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libfontenc

$(install_dir)/.build/libXfont2:		$(script_dir)/components/libraries/libXfont2-2.0.7.tar.gz
	@linux.sh generic_build.sh libXfont2 libXfont2-2.0.7 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXfont2

$(install_dir)/.build/atk:			$(script_dir)/components/libraries/atk-2.38.0.tar.gz
	@linux.sh generic_build.sh atk atk-2.38.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/atk

$(install_dir)/.build/alsa-lib:			$(script_dir)/components/libraries/alsa-lib-1.2.12.tar.gz
	@linux.sh generic_build.sh alsa-lib alsa-lib-1.2.12 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/alsa-lib

$(install_dir)/.build/pixman:			$(script_dir)/components/libraries/pixman-0.43.4.tar.gz
	@generic_build.sh pixman pixman-0.43.4 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/pixman

$(install_dir)/.build/cairo:			$(script_dir)/components/libraries/cairo-1.18.0.tar.gz
	@linux.sh generic_build.sh cairo cairo-1.18.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/cairo

$(install_dir)/.build/fribidi:			$(script_dir)/components/libraries/fribidi-1.0.15.tar.gz
	@linux.sh generic_build.sh fribidi fribidi-1.0.15 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/fribidi

$(install_dir)/.build/pango:			$(install_dir)/.build/cairo								\
						$(script_dir)/components/libraries/pango-1.54.0.tar.gz
	@linux.sh generic_build.sh pango pango-1.54.0 $(install_dir) $(script_dir) --wrap-mode=nofallback -Dintrospection=enabled
	@touch $(install_dir)/.build/pango

$(install_dir)/.build/libxkbcommon:		$(script_dir)/components/libraries/libxkbcommon-1.7.0.tar.gz
	@linux.sh generic_build.sh libxkbcommon libxkbcommon-1.7.0 $(install_dir) $(script_dir) -Denable-docs=false 
	@touch $(install_dir)/.build/libxkbcommon

$(install_dir)/.build/libXft:			$(script_dir)/components/libraries/libXft-2.3.8.tar.gz
	@linux.sh generic_build.sh libXft libXft-2.3.8 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXft

$(install_dir)/.build/libXi:			$(script_dir)/components/libraries/libXi-1.8.2.tar.gz
	@linux.sh generic_build.sh libXi libXi-1.8.2 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXi

$(install_dir)/.build/libXinerama:		$(script_dir)/components/libraries/libXinerama-1.1.5.tar.gz
	@linux.sh generic_build.sh libXinerama libXinerama-1.1.5 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXinerama

$(install_dir)/.build/libXrandr:		$(script_dir)/components/libraries/libXrandr-1.5.4.tar.gz
	@linux.sh generic_build.sh libXrandr libXrandr-1.5.4 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXrandr

$(install_dir)/.build/libXres:			$(script_dir)/components/libraries/libXres-1.2.2.tar.gz
	@linux.sh generic_build.sh libXres libXres-1.2.2 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXres

$(install_dir)/.build/libXtst:			$(script_dir)/components/libraries/libXtst-1.2.5.tar.gz
	@linux.sh generic_build.sh libXtst libXtst-1.2.5 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXtst

$(install_dir)/.build/libXv:			$(script_dir)/components/libraries/libXv-1.0.13.tar.gz
	@linux.sh generic_build.sh libXv libXv-1.0.13 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXv

$(install_dir)/.build/libXvMC:			$(script_dir)/components/libraries/libXvMC-1.0.14.tar.gz
	@linux.sh generic_build.sh libXvMC libXvMC-1.0.14 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXvMC

$(install_dir)/.build/libXxf86dga:		$(script_dir)/components/libraries/libXxf86dga-1.1.6.tar.gz
	@linux.sh generic_build.sh libXxf86dga libXxf86dga-1.1.6 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXxf86dga

$(install_dir)/.build/libXxf86vm:		$(script_dir)/components/libraries/libXxf86vm-1.1.6.tar.gz
	@linux.sh generic_build.sh libXxf86vm libXxf86vm-1.1.6 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXxf86vm

$(install_dir)/.build/libpciaccess:		$(script_dir)/components/libraries/libpciaccess-0.18.1.tar.gz
	@linux.sh generic_build.sh libpciaccess libpciaccess-0.18.1 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libpciaccess

$(install_dir)/.build/libxkbfile:		$(script_dir)/components/libraries/libxkbfile-1.1.3.tar.gz
	@linux.sh generic_build.sh libxkbfile libxkbfile-1.1.3 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libxkbfile

$(install_dir)/.build/libxshmfence:		$(script_dir)/components/libraries/libxshmfence-1.3.3.tar.gz
	@linux.sh generic_build.sh libxshmfence libxshmfence-1.3.3 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libxshmfence

$(install_dir)/.build/libXpresent:		$(script_dir)/components/libraries/libXpresent-1.0.1.tar.gz
	@linux.sh generic_build.sh libXpresent libXpresent-1.0.1 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --localstatedir=$(install_dir)/var --disable-static
	@touch $(install_dir)/.build/libXpresent

$(install_dir)/.build/libarchive:		$(script_dir)/components/libraries/libarchive-3.7.2.tar.gz
	@$(if $(os_darwin),CC=clang CXX=clang++,) $(script_dir)/scripts/generic_build.sh libarchive libarchive-3.7.2 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libarchive

$(install_dir)/.build/autoconf:			$(install_dir)/.build/libtool 								\
						$(script_dir)/components/utilities/autoconf-2.72.tar.gz
	@generic_build.sh autoconf autoconf-2.72 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/autoconf

$(install_dir)/.build/diffutils:		$(script_dir)/components/utilities/diffutils-3.10.tar.gz
	@generic_build.sh diffutils diffutils-3.10 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/diffutils

$(install_dir)/.build/file:			$(script_dir)/components/utilities/file-5.45.tar.gz
	@generic_build.sh file file-5.45 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/file

$(install_dir)/.build/findutils:		$(script_dir)/components/utilities/findutils-4.10.0.tar.gz
	@generic_build.sh findutils findutils-4.10.0 $(install_dir) $(script_dir)  --localstatedir=$(install_dir)/var/lib/locate
	@touch $(install_dir)/.build/findutils

$(install_dir)/.build/grep:			$(script_dir)/components/utilities/grep-3.11.tar.gz
	@generic_build.sh grep grep-3.11 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/grep

$(install_dir)/.build/tar:			$(install_dir)/.build/libiconv 								\
						$(script_dir)/components/utilities/tar-1.35.tar.gz
	@$(if $(os_darwin),LDFLAGS="$(LDFLAGS) -liconv -lintl",) generic_build.sh tar tar-1.35 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/tar

$(install_dir)/.build/automake:			
	@generic_build.sh automake automake-1.17 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/automake

$(install_dir)/.build/libevent:			$(script_dir)/components/libraries/libevent-2.1.12-stable.tar.gz
	@generic_build.sh libevent libevent-2.1.12-stable $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libevent

$(install_dir)/.build/libdaemon:		$(script_dir)/components/libraries/libdaemon-0.14.tar.gz
	@linux.sh generic_build.sh libdaemon libdaemon-0.14 $(install_dir) $(script_dir) --disable-static --build=aarch64-unknown-linux-gnu
	@touch $(install_dir)/.build/libdaemon

$(install_dir)/.build/shared_mime_info:		$(script_dir)/components/libraries/shared-mime-info-2.4.tar.gz
	@linux.sh generic_build.sh shared_mime_info shared-mime-info-2.4 $(install_dir) $(script_dir) --buildtype=release -Dupdate-mimedb=true
	@touch $(install_dir)/.build/shared_mime_info

$(install_dir)/.build/libjpeg-turbo:		$(install_dir)/.build/cmake								\
						$(script_dir)/components/libraries/libjpeg-turbo-3.0.1.tar.gz
	@generic_build.sh libjpeg-turbo libjpeg-turbo-3.0.1 $(install_dir) $(script_dir) -DCMAKE_BUILD_TYPE=RELEASE -DENABLE_STATIC=FALSE
	@touch $(install_dir)/.build/libjpeg-turbo

$(install_dir)/.build/gdk-pixbuf:		$(install_dir)/.build/shared_mime_info							\
						$(install_dir)/.build/docutils 								\
						$(install_dir)/.build/libpng								\
						$(install_dir)/.build/libtiff								\
						$(install_dir)/.build/libjpeg-turbo							\
						$(script_dir)/components/libraries/gdk-pixbuf-2.42.12.tar.gz
	@linux.sh generic_build.sh gdk-pixbuf gdk-pixbuf-2.42.12 $(install_dir) $(script_dir) -Dbuiltin_loaders=jpeg --wrap-mode=nofallback -Dtests=false
	@touch $(install_dir)/.build/gdk-pixbuf

$(install_dir)/.build/dbus:			$(script_dir)/components/libraries/dbus-1.16.0.tar.gz
	@linux.sh generic_build.sh dbus dbus-1.16.0 $(install_dir) $(script_dir) --wrap-mode=nofallback -D systemd=disabled 
	@touch $(install_dir)/.build/dbus

$(install_dir)/.build/at-spi2-core:		$(install_dir)/.build/dbus								\
						$(script_dir)/components/libraries/at-spi2-core-2.54.1.tar.gz
	@linux.sh generic_build.sh at-spi2-core at-spi2-core-2.54.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/at-spi2-core

$(install_dir)/.build/glfw:			$(script_dir)/components/libraries/glfw-3.4.tar.gz
	@linux.sh generic_build.sh glfw glfw-3.4 $(install_dir) $(script_dir) -DCMAKE_BUILD_TYPE=RELEASE -DENABLE_STATIC=FALSE
	@touch $(install_dir)/.build/glfw

$(install_dir)/.build/gtk2:			$(install_dir)/.build/at-spi2-core							\
						$(install_dir)/.build/glfw								\
						$(install_dir)/.build/mesa								\
						$(script_dir)/components/libraries/gtk+-2.24.33.tar.gz
	@linux.sh generic_build.sh gtk2 gtk+-2.24.33 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/gtk2

$(install_dir)/.build/gtk3:			$(install_dir)/.build/at-spi2-core							\
						$(install_dir)/.build/glfw								\
						$(install_dir)/.build/mesa								\
						$(script_dir)/components/libraries/gtk-3.24.49.tar.gz
	@linux.sh generic_build.sh gtk3 gtk-3.24.49 $(install_dir) $(script_dir) -D broadway_backend=false -D tests=false -D demos=false -D examples=false
	@touch $(install_dir)/.build/gtk3

$(install_dir)/.build/gtk4:			$(install_dir)/.build/at-spi2-core							\
						$(install_dir)/.build/glfw								\
						$(install_dir)/.build/mesa								\
						$(script_dir)/components/libraries/gtk-4.16.12.tar.gz
	@linux.sh generic_build.sh gtk4 gtk-4.16.12 $(install_dir) $(script_dir) -D media-gstreamer=disabled -D vulkan=disabled -D build-testsuite=false -D build-tests=false
	@touch $(install_dir)/.build/gtk4

$(install_dir)/.build/gdbm:			
	@generic_build.sh gdbm gdbm-1.24 $(install_dir) $(script_dir) --disable-static --enable-libgdbm-compat
	@touch $(install_dir)/.build/gdbm

$(install_dir)/.build/pygobject3:		$(script_dir)/components/libraries/pygobject-3.52.1.tar.gz
	@linux.sh generic_build.sh pygobject3 pygobject-3.52.1 $(install_dir) $(script_dir) --buildtype=release
	@touch $(install_dir)/.build/pygobject3

$(install_dir)/.build/pycairo:			$(script_dir)/components/libraries/pycairo-1.27.0.tar.gz
	@linux.sh generic_build.sh pycairo pycairo-1.27.0 $(install_dir) $(script_dir) --buildtype=release
	@linux.sh ln -sfv py3cairo.pc $(install_dir)/$(if $(os_darwin),lib,lib64)/pkgconfig/pycairo.pc
	@touch $(install_dir)/.build/pycairo

$(install_dir)/.build/perl-xml-parser:		$(install_dir)/.build/perl $(script_dir)/components/perl/XML-Parser-2.47.tar.gz
	@generic_build.sh perl-xml-parser XML-Parser-2.47 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/perl-xml-parser

$(install_dir)/.build/perl-parse-yapp:		$(install_dir)/.build/perl $(script_dir)/components/perl/Parse-Yapp-1.21.tar.gz
	@generic_build.sh perl-parse-yapp Parse-Yapp-1.21 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/perl-parse-yapp

$(install_dir)/.build/intltool:			$(script_dir)/components/utilities/intltool-0.51.0.tar.gz
	@generic_build.sh intltool intltool-0.51.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/intltool

$(install_dir)/.build/libtool:			$(script_dir)/components/utilities/libtool-2.5.4.tar.gz
	@generic_build.sh libtool libtool-2.5.4 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libtool

$(install_dir)/.build/sed:			$(script_dir)/components/utilities/sed-4.9.tar.gz
	@generic_build.sh sed sed-4.9 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/sed

$(install_dir)/.build/apr:			$(script_dir)/components/libraries/apr-1.7.4.tar.gz
	@generic_build.sh apr apr-1.7.4 $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/apr

$(install_dir)/.build/aprutil:			$(script_dir)/components/libraries/apr-util-1.6.3.tar.gz
	@generic_build.sh aprutil apr-util-1.6.3 $(install_dir) $(script_dir) --with-apr=$(install_dir)
	@touch $(install_dir)/.build/aprutil

$(install_dir)/.build/libatomic_ops:		$(script_dir)/components/libraries/libatomic_ops-7.8.2.tar.gz
	@generic_build.sh libatomic_ops libatomic_ops-7.8.2 $(install_dir) $(script_dir) --enable-shared --disable-static
	@touch $(install_dir)/.build/libatomic_ops

$(install_dir)/.build/gawk:			$(script_dir)/components/utilities/gawk-4.2.1.tar.gz
	@generic_build.sh gawk gawk-4.2.1 $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/gawk

$(install_dir)/.build/httpd:			$(script_dir)/components/utilities/httpd-2.4.58.tar.gz
	@generic_build.sh httpd httpd-2.4.58 $(install_dir) $(script_dir) --enable-authnz-fcgi --enable-mods-shared="all" --enable-mods-shared="cgi" --enable-mpms-shared=all
	@touch $(install_dir)/.build/httpd

$(install_dir)/.build/bash:			$(script_dir)/components/utilities/bash-5.2.tar.gz
	@generic_build.sh bash bash-5.2 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/bash

$(install_dir)/.build/afsctool:			$(install_dir)/.build/sparsehash							\
						$(script_dir)/components/utilities/afsctool-1.7.3.tar.gz
	@generic_build.sh afsctool afsctool-1.7.3 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/afsctool

$(install_dir)/.build/nasm:			$(script_dir)/components/languages/nasm-2.16.03.tar.gz
	@generic_build.sh nasm nasm-2.16.03 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/nasm

$(install_dir)/.build/cpio:			$(install_dir)/.build/sparsehash							\
						$(script_dir)/components/utilities/cpio-2.15.tar.gz
	@generic_build.sh cpio cpio-2.15 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/cpio

$(install_dir)/.build/citus:			$(if $(os_linux),$(install_dir)/.build/kerb5) 						\
						$(install_dir)/.build/postgresql							\
						$(script_dir)/components/services/$(citus_v).tar.gz
	@generic_build.sh citus $(citus_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/citus

$(install_dir)/.build/util-linux:		$(script_dir)/components/utilities/$(util-linux_v).tar.gz
	@generic_build.sh util-linux $(util-linux_v) $(install_dir) $(script_dir) 							\
						--runstatedir=$(install_dir)/run    							\
						--disable-wall										\
						--disable-mount										\
						--disable-chfn-chsh   									\
						--disable-login       									\
						--disable-nologin     									\
						--disable-su          									\
						--disable-setpriv     									\
						--disable-runuser     									\
						--disable-pylibmount  									\
						--disable-liblastlog2 									\
						--disable-static      									\
						--without-python      									\
						--without-systemd     									\
						--without-systemdsystemunitdir   
	@touch $(install_dir)/.build/util-linux

$(install_dir)/.build/e2fsprogs:		$(install_dir)/.build/util-linux							\
						$(script_dir)/components/utilities/$(e2fsprogs_v).tar.gz
	@generic_build.sh e2fsprogs $(e2fsprogs_v) $(install_dir) $(script_dir) 							\
						--sysconfdir=$(install_dir)/etc       							\
						--with-crond-dir=$(install_dir)/etc/cron.d						\
						--enable-elf-shlibs     								\
						--disable-libblkid      								\
						--disable-libuuid       								\
						--disable-uuidd         								\
						--disable-fsck
	@touch $(install_dir)/.build/e2fsprogs

$(install_dir)/.build/kerb5:			$(install_dir)/.build/e2fsprogs								\
						$(script_dir)/components/libraries/$(kerb5_v).tar.gz
	@stage.sh kerb5 $(kerb5_v) $(install_dir) $(script_dir) 
	@pushd $(kerb5_v)/src && ./configure --prefix=$(install_dir)									\
						--sysconfdir=$(install_dir)/etc        							\
						--localstatedir=$(install_dir)/var/lib 							\
						--runstatedir=$(install_dir)/run       							\
						--with-system-et         								\
						--with-system-ss         								\
						--with-system-verto=no   								\
						--enable-dns-for-realm   								\
						--disable-rpath   								     	\
			&& popd
	@rm -rf *
	@touch $(install_dir)/.build/kerb5

$(install_dir)/.build/postgresql:		$(install_dir)/.build/icu4c $(script_dir)/components/services/$(postgres_v).tar.gz
	@env -i bash -l $(script_dir)/scripts/generic_build.sh postgresql $(postgres_v) $(install_dir) $(script_dir) --with-openssl
	@touch $(install_dir)/.build/postgresql

$(install_dir)/include/linux/udmabuf.h:		$(script_dir)/include/linux/udmabuf.h
	@mkdir -p $(install_dir)/include/linux/
	@cp $(script_dir)/include/linux/udmabuf.h $(install_dir)/include/linux/

$(install_dir)/include/intrin.h:		$(script_dir)/include/intrin.h
	@cp $(script_dir)/include/*.h $(install_dir)/include/

$(install_dir)/.build/liburing:			$(install_dir)/include/linux/udmabuf.h							\
						$(script_dir)/components/libraries/$(liburing_v).tar.gz
	@linux.sh generic_build.sh liburing $(liburing_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/liburing

$(install_dir)/.build/numactl:			$(script_dir)/components/libraries/$(numactl_v).tar.gz
	@linux.sh generic_build.sh numactl $(numactl_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/numactl

$(install_dir)/.build/k-postgresql:		$(install_dir)/.build/liburing								\
						$(install_dir)/.build/numactl								\
						$(install_dir)/.build/icu4c 
	@env -i bash -l $(script_dir)/scripts/generic_build.sh k-postgresql $(kpostgres_v) $(install_dir)/opt/k-postgresql $(script_dir) 		\
						--with-openssl										\
						--with-lz4										\
						--with-zstd										\
						$(if $(os_linux),--with-liburing) 							\
						--with-libcurl										\
						$(if $(os_linux),--with-libnuma) 							\
						--with-libxml										\
						--with-libxslt										\
						$(if $(os_linux),--with-llvm) 								\
						--with-tcl										\
						--with-tclconfig=$(install_dir)/lib							\
						--with-python										\
						--with-wal-blocksize=8									\
						--with-segsize=1									\
						--with-segsize-blocks=0									\
						--with-blocksize=8
	@touch $(install_dir)/.build/k-postgresql




$(install_dir)/.build/prolog-osx:		$(script_dir)/components/languages/swipl-9.3.15.tar.gz
	@generic_build.sh prolog-osx swipl-9.3.15 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/prolog-osx

$(install_dir)/.build/prolog-linux:		$(script_dir)/components/languages/swipl-9.3.15.tar.gz
	@linux.sh generic_build.sh prolog-linux swipl-9.3.15 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/prolog-linux

$(install_dir)/.build/prolog:			$(if $(os_darwin),$(install_dir)/.build/prolog-osx)					\
						$(install_dir)/.build/prolog-linux	

$(install_dir)/.build/otp:			$(install_dir)/.build/unixodbc								\
						$(install_dir)/.build/wxWidgets								\
						$(script_dir)/components/languages/otp_src_27.2.tar.gz
	@generic_build.sh otp otp_src_27.2 $(install_dir) $(script_dir) --with-odbc=$(install_dir) --with-ssl=$(install_dir)
	@touch $(install_dir)/.build/otp

$(install_dir)/.build/tcl:			$(install_dir)/.build/libzip	
	@generic_build.sh tcl $(tcl_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/tcl

$(install_dir)/.build/tcl9:			$(install_dir)/.build/libzip	
	@generic_build.sh tcl9 $(tcl9_v) $(install_dir)/opt/tcl9 $(script_dir) --enable-64bit
	@touch $(install_dir)/.build/tcl9

$(install_dir)/.build/cryptlib:				
	@generic_build.sh cryptlib $(cryptlib_v) $(install_dir) $(script_dir) DESTDIR=$(install_dir)
	@touch $(install_dir)/.build/cryptlib

$(install_dir)/.build/critcl:		
	@stage.sh critcl $(critcl_v) $(install_dir) $(script_dir) 
	@pushd $(critcl_v) && tclsh ./build.tcl install && popd
	@rm -rf *		
	@touch $(install_dir)/.build/critcl

$(install_dir)/.build/tk:			$(script_dir)/components/libraries/tk8.6.14.tar.gz
	@generic_build.sh tk tk8.6.14 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/tk

$(install_dir)/.build/tclmtls-linux:		$(script_dir)/components/libraries/tclmtls-1.2.0.tar.gz
	@linux.sh generic_build.sh tclmtls-linux tclmtls-1.2.0 $(install_dir) $(script_dir) --with-tcl=$(install_dir)/lib --with-mbedtls=$(install_dir) --with-mbedtls-include=$(install_dir)/include --with-mbedtls-lib=$(install_dir)/lib
	@touch $(install_dir)/.build/tclmtls-linux

$(install_dir)/.build/tclmtls:			$(script_dir)/components/libraries/tclmtls-1.2.0.tar.gz
	@generic_build.sh tclmtls tclmtls-1.2.0 $(install_dir) $(script_dir) --with-tcl=$(install_dir)/lib --with-mbedtls=$(install_dir) --with-mbedtls-include=$(install_dir)/include --with-mbedtls-lib=$(install_dir)/lib
	@touch $(install_dir)/.build/tclmtls

$(install_dir)/.build/nsd:			$(script_dir)/components/utilities/nsd-4.5.tar.gz
	@generic_build.sh nsd nsd-4.5 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/nsd

$(install_dir)/.build/rdm-14:
	@generic_build.sh rdm-14 rdm-14 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/rdm-14

$(install_dir)/.build/rdm-12:
	@generic_build.sh rdm-12 rdm-12 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/rdm-12

$(install_dir)/.build/rdm-16:
	@generic_build.sh rdm-16 rdm-16 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/rdm-16

$(install_dir)/.build/mbedtls:			$(install_dir)/.build/markupsafe							\
						$(install_dir)/.build/jsonschema 							\
						$(install_dir)/.build/jinja2 								\
						$(install_dir)/.build/attrs								\
						$(script_dir)/components/libraries/mbedtls-3.6.0.tar.gz
	@generic_build.sh mbedtls mbedtls-3.6.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/mbedtls

$(install_dir)/.build/mesa:			$(install_dir)/.build/cbindgen 								\
						$(install_dir)/.build/mako 								\
						$(install_dir)/.build/pyyaml								\
						$(install_dir)/.build/pycparser								\
						$(install_dir)/.build/glslang								\
						$(install_dir)/.build/libclc								\
						$(install_dir)/.build/spirv-headers							\
						$(install_dir)/.build/spirv-tools							\
						$(install_dir)/.build/spirv-llvm-translator						\
						$(script_dir)/components/libraries/mesa-25.0.2.tar.gz
	@CC=gcc CXX=g++ PATH="$(llvm_dir)/bin:$(install_dir)/.cargo/bin:$(PATH)" linux.sh generic_build.sh mesa mesa-25.0.2 $(install_dir) $(script_dir) -Dplatforms=x11,wayland -Dgallium-drivers=auto -Dglx=dri -Degl=enabled -Dvalgrind=disabled -Dvideo-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc -Dlibunwind=disabled
	@touch $(install_dir)/.build/mesa

$(install_dir)/.build/gmp:			$(script_dir)/components/libraries/gmp-6.3.0.tar.gz
	@generic_build.sh gmp gmp-6.3.0 $(install_dir) $(script_dir) --enable-cxx --disable-static
	@touch $(install_dir)/.build/gmp

$(install_dir)/.build/mpfr:			$(script_dir)/components/libraries/mpfr-4.2.1.tar.gz
	@generic_build.sh mpfr mpfr-4.2.1 $(install_dir) $(script_dir) --enable-thread-safe --disable-static
	@touch $(install_dir)/.build/mpfr

$(install_dir)/.build/mpc:			$(install_dir)/.build/mpfr								\
						$(script_dir)/components/libraries/mpc-1.3.1.tar.gz
	@generic_build.sh mpc mpc-1.3.1 $(install_dir) $(script_dir) --enable-thread-safe --disable-static
	@touch $(install_dir)/.build/mpc

$(install_dir)/.build/isl:			$(script_dir)/components/libraries/isl-0.24.tar.gz
	@generic_build.sh isl isl-0.24 $(install_dir) $(script_dir) --enable-thread-safe --disable-static
	@touch $(install_dir)/.build/isl

$(install_dir)/.build/icu4c:			$(script_dir)/components/libraries/icu4c-74.2.tar.gz
	@generic_build.sh icu4c icu4c-74.2 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/icu4c

$(install_dir)/.build/libwebp:			$(script_dir)/components/libraries/libwebp-1.2.1.tar.gz
	@generic_build.sh libwebp libwebp-1.2.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libwebp

$(install_dir)/.build/glib-networking:		$(install_dir)/.build/gsettings-desktop-schemas						\
						$(install_dir)/.build/gnutls								\
						$(script_dir)/components/libraries/glib-networking-2.80.1.tar.gz
	@linux.sh generic_build.sh glib-networking glib-networking-2.80.1 $(install_dir) $(script_dir) -D libproxy=disabled 
	@touch $(install_dir)/.build/glib-networking

$(install_dir)/.build/gsettings-desktop-schemas:	$(script_dir)/components/libraries/gsettings-desktop-schemas-48.0.tar.gz
	@linux.sh generic_build.sh gsettings-desktop-schemas gsettings-desktop-schemas-48.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/gsettings-desktop-schemas

$(install_dir)/.build/libsoup:			$(install_dir)/.build/glib-networking							\
						$(install_dir)/.build/vala								\
						$(script_dir)/components/libraries/libsoup-2.74.3.tar.gz
	@linux.sh generic_build.sh libsoup libsoup-2.74.3 $(install_dir) $(script_dir)  -Dvapi=enabled -Dgssapi=disabled -Dsysprof=disabled 
	@touch $(install_dir)/.build/libsoup

$(install_dir)/.build/libsoup3:			$(install_dir)/.build/glib-networking							\
						$(install_dir)/.build/vala								\
						$(install_dir)/.build/nghttp2								\
						$(script_dir)/components/libraries/libsoup-3.6.5.tar.gz
	@linux.sh generic_build.sh libsoup3 libsoup-3.6.5 $(install_dir) $(script_dir)  -Dvapi=enabled -Dgssapi=disabled -Dsysprof=disabled 
	@touch $(install_dir)/.build/libsoup3

#$(install_dir)/.build/icu-le-hb:		$(script_dir)/components/libraries/icu-le-hb-2.0.0.tar.gz
#	@generic_build.sh icu-le-hb icu-le-hb-2.0.0 $(install_dir) $(script_dir) 
#	@touch $(install_dir)/.build/icu-le-hb

$(install_dir)/.build/ruby:			$(install_dir)/.build/libyaml								\
						$(script_dir)/components/languages/ruby-3.4.4.tar.gz
	@generic_build.sh ruby ruby-3.4.4 $(install_dir) $(script_dir) --disable-rpath --enable-shared --without-valgrind -disable-install-doc --without-baseruby ac_cv_func_qsort_r=no
	@touch $(install_dir)/.build/ruby

$(install_dir)/.build/vala:			$(install_dir)/.build/graphviz								\
						$(script_dir)/components/languages/vala-0.56.17.tar.gz
	@linux.sh generic_build.sh vala vala-0.56.17 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/vala

$(install_dir)/.build/graphviz:			$(script_dir)/components/libraries/graphviz-13.0.1.tar.gz
	@generic_build.sh graphviz graphviz-13.0.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/graphviz

$(install_dir)/.build/libsecret:		$(install_dir)/.build/libgcrypt								\
						$(script_dir)/components/libraries/libsecret-0.21.7.tar.gz
	@linux.sh generic_build.sh libsecret libsecret-0.21.7 $(install_dir) $(script_dir) --buildtype=release -Dgtk_doc=false -Dmanpage=false
	@touch $(install_dir)/.build/libsecret

$(install_dir)/.build/lcms2:			$(script_dir)/components/libraries/lcms2-2.17.tar.gz
	@generic_build.sh lcms2 lcms2-2.17 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/lcms2

$(install_dir)/.build/libavif:			$(install_dir)/.build/libyuv								\
						$(script_dir)/components/libraries/libavif-1.3.0.tar.gz
	@generic_build.sh libavif libavif-1.3.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libavif

$(install_dir)/.build/highway:			$(script_dir)/components/libraries/highway-1.2.0.tar.gz
	@linux.sh generic_build.sh highway highway-1.2.0 $(install_dir) $(script_dir) -D HWY_ENABLE_TESTS=OFF
	@touch $(install_dir)/.build/highway

$(install_dir)/.build/libyuv:			$(script_dir)/components/libraries/libyuv.tar.gz
	@generic_build.sh libyuv libyuv $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libyuv

$(install_dir)/.build/libseccomp:			$(script_dir)/components/libraries/libseccomp-2.6.0.tar.gz
	@linux.sh generic_build.sh libseccomp libseccomp-2.6.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libseccomp

$(install_dir)/.build/xdg-dbus-proxy:			$(script_dir)/components/libraries/xdg-dbus-proxy-0.1.6.tar.gz
	@linux.sh generic_build.sh xdg-dbus-proxy xdg-dbus-proxy-0.1.6 $(install_dir) $(script_dir) --disable-man
	@touch $(install_dir)/.build/xdg-dbus-proxy

$(install_dir)/.build/libcap:			$(script_dir)/components/libraries/libcap-2.76.tar.gz
	@linux.sh generic_build.sh libcap libcap-2.76 $(install_dir) $(script_dir) prefix=$(install_dir)
	@touch $(install_dir)/.build/libcap

#$(install_dir)/.build/gstreamer:			$(script_dir)/components/libraries/gstreamer-1.26.2.tar.gz
#	@generic_build.sh gstreamer gstreamer-1.26.2 $(install_dir) $(script_dir) -D gst_debug=false
#	@touch $(install_dir)/.build/gstreamer

$(install_dir)/.build/gstreamer-main:			$(script_dir)/components/libraries/gstreamer-main.tar.gz
	@linux.sh generic_build.sh gstreamer-main gstreamer-main $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/gstreamer-main

$(install_dir)/.build/bubblewrap:		$(install_dir)/.build/libcap								\
						$(script_dir)/components/libraries/bubblewrap-0.11.0.tar.gz
	@linux.sh generic_build.sh libseccomp bubblewrap-0.11.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/bubblewrap

$(install_dir)/.build/unifdef:		$(script_dir)/components/libraries/unifdef-2.12.tar.gz
	@generic_build.sh unifdef unifdef-2.12 $(install_dir) $(script_dir) prefix=$(install_dir)
	@touch $(install_dir)/.build/unifdef

$(install_dir)/.build/libjxl:			$(install_dir)/.build/highway								\
						$(install_dir)/.build/brotli								\
						$(install_dir)/.build/lcms2								\
						$(install_dir)/.build/libavif								\
						$(script_dir)/components/libraries/libjxl-0.11.1.tar.gz
	@linux.sh generic_build.sh libjxl libjxl-0.11.1 $(install_dir) $(script_dir) -D CMAKE_BUILD_TYPE=Release              			\
						      -D BUILD_TESTING=OFF                     						\
						      -D BUILD_SHARED_LIBS=ON                  						\
						      -D JPEGXL_ENABLE_SKCMS=OFF               						\
						      -D JPEGXL_ENABLE_SJPEG=OFF               						\
						      -D JPEGXL_ENABLE_PLUGINS=ON             
	@touch $(install_dir)/.build/libjxl

$(install_dir)/.build/webkitgtk:		$(install_dir)/.build/ruby								\
						$(install_dir)/.build/libtasn								\
						$(install_dir)/.build/icu4c								\
						$(install_dir)/.build/libwebp								\
						$(install_dir)/.build/libsoup								\
						$(install_dir)/.build/libsoup3								\
						$(install_dir)/.build/libsecret								\
						$(install_dir)/.build/libjxl								\
						$(install_dir)/.build/libseccomp							\
						$(install_dir)/.build/bubblewrap							\
						$(install_dir)/.build/xdg-dbus-proxy							\
						$(install_dir)/.build/unifdef								\
						$(install_dir)/.build/pygobject3							\
						$(install_dir)/.build/gstreamer-main
	@linux.sh generic_build.sh webkitgtk $(webkitgtk_v) $(install_dir) $(script_dir) -D CMAKE_SKIP_INSTALL_RPATH=ON  		\
						      -D PORT=GTK                     							\
						      -D USE_LIBBACKTRACE=OFF         							\
						      -D USE_LIBHYPHEN=OFF            							\
						      -D ENABLE_GAMEPAD=OFF           							\
						      -D ENABLE_MINIBROWSER=ON        							\
						      -D ENABLE_DOCUMENTATION=OFF     							\
						      -D ENABLE_WEBDRIVER=OFF         							\
						      -D USE_WOFF2=OFF                							\
						      -D USE_GTK4=OFF                 							\
						      -D ENABLE_UNIFIED_BUILDS=ON							\
						      -D ENABLE_JOURNALD_LOG=OFF      							\
						      -D ENABLE_BUBBLEWRAP_SANDBOX=ON 							\
						      -D USE_SYSPROF_CAPTURE=NO       							\
						      -D ENABLE_SPEECH_SYNTHESIS=OFF  							\
						      -D ENABLE_SPELLCHECK=OFF								\
						      -W no-dev
	@touch $(install_dir)/.build/webkitgtk

$(install_dir)/.build/wxWidgets:		$(install_dir)/.build/gdk-pixbuf							\
						$(install_dir)/.build/pixman								\
						$(install_dir)/.build/fribidi								\
						$(install_dir)/.build/pango								\
						$(install_dir)/.build/libdrm								\
						$(install_dir)/.build/gtk4								\
						$(install_dir)/.build/gtk3								\
						$(install_dir)/.build/gtk2								\
						$(install_dir)/.build/webkitgtk								\
						$(install_dir)/.build/glu								\
						$(install_dir)/.build/freeglut								\
						$(if $(experimental), $(install_dir)/.build/qt6)					\
						$(script_dir)/components/libraries/wxWidgets-3.2.4.tar.gz
	@generic_build.sh wxWidgets wxWidgets-3.2.4 $(install_dir) $(script_dir) --enable-webview  --enable-compat30
	@touch $(install_dir)/.build/wxWidgets

$(install_dir)/.build/attr:			$(script_dir)/components/utilities/attr-2.5.2.tar.gz
	@linux.sh generic_build.sh attr attr-2.5.2 $(install_dir) $(script_dir) --sysconfdir=$(install_dir)/etc --disable-static
	@touch $(install_dir)/.build/attr

$(install_dir)/.build/acl:			$(script_dir)/components/utilities/$(acl_v).tar.gz
	@linux.sh generic_build.sh acl $(acl_v) $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/acl

$(install_dir)/.build/libxcrypt:		$(script_dir)/components/libraries/libxcrypt-4.4.36.tar.gz
	@generic_build.sh libxcrypt libxcrypt-4.4.36 $(install_dir) $(script_dir) --disable-static --enable-hashes=strong,glibc --enable-obsolete-api=no --disable-failure-tokens
	@touch $(install_dir)/.build/libxcrypt

$(install_dir)/.build/psmisc:			$(script_dir)/components/utilities/psmisc-23.7.tar.gz
	@linux.sh generic_build.sh psmisc psmisc-23.7 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/psmisc

$(install_dir)/.build/check:			$(script_dir)/components/utilities/check-0.15.2.tar.gz
	@generic_build.sh check check-0.15.2 $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/check

$(install_dir)/.build/libpipeline:		$(script_dir)/components/libraries/libpipeline-1.5.7.tar.gz
	@generic_build.sh libpipeline libpipeline-1.5.7 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/libpipeline

$(install_dir)/.build/procps:			$(script_dir)/components/utilities/procps-ng-4.0.4.tar.gz
	@linux.sh generic_build.sh procps procps-ng-4.0.4 $(install_dir) $(script_dir) --disable-static 
	@touch $(install_dir)/.build/procps

$(install_dir)/.build/which:			$(script_dir)/components/utilities/which-2.21.tar.gz
	@generic_build.sh which which-2.21 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/which

$(install_dir)/.build/unixodbc:			$(script_dir)/components/libraries/unixODBC-2.3.12.tar.gz
	@generic_build.sh unixodbc unixODBC-2.3.12 $(install_dir) $(script_dir)  --sysconfdir=$(install_dir)/etc/unixODBC
	@touch $(install_dir)/.build/unixodbc

$(install_dir)/.build/abseil-cpp:		$(script_dir)/components/libraries/$(abseil-cpp_v).tar.gz
	@generic_build.sh abseil-cpp $(abseil-cpp_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/abseil-cpp

$(install_dir)/.build/hwloc:			$(script_dir)/components/libraries/hwloc-2.12.0.tar.gz
	@generic_build.sh hwloc hwloc-2.12.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/hwloc

$(install_dir)/.build/openmpi:			$(script_dir)/components/libraries/openmpi-5.0.7.tar.gz
	@generic_build.sh openmpi openmpi-5.0.7 $(install_dir) $(script_dir) --disable-io-romio	
	@touch $(install_dir)/.build/openmpi

$(install_dir)/.build/boost:			$(install_dir)/.build/openmpi								\
						$(script_dir)/components/libraries/boost_1_87_0.tar.gz
	@generic_build.sh boost boost_1_87_0 $(install_dir) $(script_dir) --with-test 
	@touch $(install_dir)/.build/boost

$(install_dir)/.build/openblas:			
	@generic_build.sh openblas OpenBLAS-0.3.30 $(install_dir) $(script_dir) -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=$(if ($(UNAME_S),Darwin),OFF,ON) -DC_LAPACK=ON -DBUILD_RELAPACK=ON
	@touch $(install_dir)/.build/openblas

$(install_dir)/.build/lapack:			
	@generic_build.sh lapack lapack-3.12.1 $(install_dir) $(script_dir)  -DCBLAS=ON 
	@touch $(install_dir)/.build/lapack

$(install_dir)/.build/scalapack:		$(script_dir)/components/libraries/scalapack-2.2.2.tar.gz
	@generic_build.sh scalapack scalapack-2.2.2 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/scalapack

$(install_dir)/.build/brotli:			$(script_dir)/components/libraries/brotli-1.1.0.tar.gz
	@generic_build.sh brotli brotli-1.1.0 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/brotli

$(install_dir)/.build/clapack:			$(script_dir)/components/libraries/clapack-3.2.1.tar.gz
	@skip.sh generic_build.sh clapack clapack-3.2.1 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/clapack

$(install_dir)/.build/clucene:			$(script_dir)/components/libraries/clucene-core-2.3.3.4.tar.gz
	@_GNU_SOURCE=1 $(script_dir)/scripts/linux.sh $(script_dir)/scripts/generic_build.sh clucene clucene-core-2.3.3.4 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/clucene

$(install_dir)/.build/libyaml:			$(script_dir)/components/libraries/libyaml-0.2.5.tar.gz
	@generic_build.sh libyaml libyaml-0.2.5 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libyaml

$(install_dir)/.build/libunwind:		$(script_dir)/components/libraries/libunwind-1.6.2.tar.gz
	@linux.sh generic_build.sh libunwind libunwind-1.6.2 $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/libunwind

$(install_dir)/.build/freeglut:		$(script_dir)/components/libraries/freeglut-3.6.0.tar.gz
	@skip.sh generic_build.sh freeglut freeglut-3.6.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/freeglut

$(install_dir)/.build/glu:		$(script_dir)/components/libraries/freeglut-3.6.0.tar.gz
	@linux.sh generic_build.sh glu glu-9.0.3 $(install_dir) $(script_dir) -D gl_provider=gl
	@touch $(install_dir)/.build/glu

$(install_dir)/.build/cups:			$(script_dir)/components/libraries/cups-2.4.11.tar.gz
	@MFLAGS="V=1" linux.sh generic_build.sh cups cups-2.4.11 $(install_dir) $(script_dir) -v --with-rcdir=$(install_dir)/tmp/cupsinit  --with-rundir=$(install_dir)/run/cups --with-icondir=$(install_dir)/tmp --with-menudir=$(install_dir)/tmp --with-xinetd=$(install_dir)/etc/xinetd.d --with-dbusdir=$(install_dir)/etc/dbus-1 --with-system-groups=lpadmin
	@touch $(install_dir)/.build/cups

$(install_dir)/.build/level-zero:		$(script_dir)/components/libraries/level-zero-1.21.6.tar.gz		
	@linux.sh generic_build.sh level-zero level-zero-1.21.6 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/level-zero

$(install_dir)/.build/openjdk:			$(install_dir)/.build/alsa-lib								\
						$(install_dir)/.build/cups								\
						$(install_dir)/.build/x11				
	@generic_build.sh openjdk $(openjdk_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/openjdk

$(install_dir)/.build/fdupes:						
	@generic_build.sh fdupes $(fdupes_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/fdupes

$(install_dir)/.build/libb2:			$(script_dir)/components/libraries/libb2-0.98.1.tar.gz
	@generic_build.sh libb2 libb2-0.98.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libb2

$(install_dir)/.build/elfutils:			$(script_dir)/components/libraries/elfutils-0.191.tar.gz
	@CXXFLAGS="-O3 $(CXXFLAGS)" linux.sh generic_build.sh elfutils elfutils-0.191 $(install_dir) $(script_dir) --disable-debuginfod
	@touch $(install_dir)/.build/elfutils

$(install_dir)/.build/texinfo:			$(install_dir)/.build/libiconv								\
						$(install_dir)/.build/gettext
	@generic_build.sh texinfo texinfo-7.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/texinfo

$(install_dir)/.build/nettle:			$(install_dir)/.build/gmp								\
						$(install_dir)/.build/p11-kit								\
						$(script_dir)/components/libraries/nettle-3.10.1.tar.gz
	@generic_build.sh nettle nettle-3.10.1 $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/nettle

$(install_dir)/.build/jansson:			$(script_dir)/components/libraries/jansson-2.14.tar.gz
	@generic_build.sh jansson jansson-2.14 $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/jansson

$(install_dir)/.build/gnutls:			$(install_dir)/.build/nettle								\
						$(install_dir)/.build/libunistring							\
						$(script_dir)/components/libraries/gnutls-3.8.9.tar.gz
	@generic_build.sh gnutls gnutls-3.8.9 $(install_dir) $(script_dir) --with-default-trust-store-pkcs11="pkcs11:"
	@touch $(install_dir)/.build/gnutls

$(install_dir)/.build/leancrypto:		$(script_dir)/components/libraries/leancrypto-1.3.0.tar.gz
	@generic_build.sh leancrypto leancrypto-1.3.0 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/leancrypto

$(install_dir)/.build/lmdb:			$(script_dir)/components/libraries/lmdb-0.9.31.tar.gz
	@generic_build.sh lmdb lmdb-0.9.31 $(install_dir) $(script_dir) prefix=$(install_dir)
	@touch $(install_dir)/.build/lmdb

$(install_dir)/.build/rabbitmq:			$(script_dir)/components/services/rabbitmq-server-4.1.0.tar.gz
	@PATH="$(binaries):$(PATH)" generic_build.sh rabbitmq rabbitmq-server-4.1.0 $(install_dir) $(script_dir) PREFIX=$(install_dir)
	@touch $(install_dir)/.build/rabbitmq

$(install_dir)/.build/nghttp2:			
	@generic_build.sh nghttp2 $(nghttp2_v) $(install_dir) $(script_dir) -DBUILD_STATIC_LIBS=ON
	@touch $(install_dir)/.build/nghttp2

$(install_dir)/.build/nghttp3:			
	@generic_build.sh nghttp3 $(nghttp3_v) $(install_dir) $(script_dir) -DBUILD_STATIC_LIBS=ON
	@touch $(install_dir)/.build/nghttp3

$(install_dir)/.build/libuv:			$(script_dir)/components/libraries/libuv-1.51.0.tar.gz
	@generic_build.sh libuv libuv-1.51.0 $(install_dir) $(script_dir) --enable-static
	@touch $(install_dir)/.build/libuv

$(install_dir)/.build/libcares:			$(script_dir)/components/libraries/c-ares-1.34.5.tar.gz
	@generic_build.sh libcares c-ares-1.34.5 $(install_dir) $(script_dir) --enable-static
	@touch $(install_dir)/.build/libcares

$(install_dir)/.build/m4ri:			$(script_dir)/components/libraries/m4ri-20250128.tar.gz
	@generic_build.sh m4ri m4ri-20250128 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/m4ri

$(install_dir)/.build/BRiAl:			$(script_dir)/components/libraries/BRiAl-1.2.12.tar.gz
	@generic_build.sh BRiAl BRiAl-1.2.12 $(install_dir) $(script_dir) --with-boost-libdir=$(install_dir)/lib
	@touch $(install_dir)/.build/BRiAl

$(install_dir)/.build/cddlib:			$(script_dir)/components/libraries/cddlib-0.94m.tar.gz
	@generic_build.sh cddlib cddlib-0.94m $(install_dir) $(script_dir)
	ln -sf cddlib $(install_dir)/include/cdd
	@touch $(install_dir)/.build/cddlib

$(install_dir)/.build/ecl:			$(script_dir)/components/libraries/ecl-24.5.10.tar.gz
	@generic_build.sh ecl ecl-24.5.10 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/ecl

$(install_dir)/.build/eclib:			$(install_dir)/.build/pari 								\
						$(install_dir)/.build/ntl								\
						$(script_dir)/components/libraries/eclib-20250122.tar.gz
	@LDFLAGS="$(LDFLAGS) -lgmp" skip.sh generic_build.sh eclib eclib-20250122 $(install_dir) $(script_dir) --disable-static --with-pari=/home/rsewell/.omnia --with-flint= --with-boost=no --disable-allprogs
	@touch $(install_dir)/.build/eclib

$(install_dir)/.build/ecm:			$(script_dir)/components/libraries/ecm-7.0.6.tar.gz
	@generic_build.sh ecm ecm-7.0.6 $(install_dir) $(script_dir) --enable-shared
	@touch $(install_dir)/.build/ecm

$(install_dir)/.build/R:			$(script_dir)/components/languages/R-4.5.1.tar.gz
	$(script_dir)/scripts/stage.sh R R-4.5.1 $(install_dir) $(script_dir)
	@mkdir -p R-4.5.1/lib  
	@cp -v $(install_dir)/lib/libbz2.* R-4.5.1/lib/.	
	@cp -v $(install_dir)/lib/libicui18n.74.* R-4.5.1/lib/.							
	@cp -v $(install_dir)/lib/libicuuc.74.* R-4.5.1/lib/.							
	@cp -v $(install_dir)/lib/libicudata.74.* R-4.5.1/lib/.							
	@generic_build.sh R R-4.5.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/R

$(install_dir)/.build/utf8proc:			$(install_dir)/.build/cmake								\
						$(script_dir)/components/libraries/utf8proc-2.10.0.tar.gz
	@generic_build.sh utf8proc utf8proc-2.10.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/utf8proc

$(install_dir)/.build/libwhich:			$(script_dir)/components/libraries/libwhich-1.2.0.tar.gz
	@stage.sh libwhich libwhich-1.2.0 $(install_dir) $(script_dir) --with-readline=$(install_dir) 
	@pushd libwhich-1.2.0 && make V=1 prefix=$(install_dir) && make prefix=$(install_dir) install && popd
	@rm -rf *
	@touch $(install_dir)/.build/libwhich

$(install_dir)/.build/julia:			$(install_dir)/.build/patchelf								\
						$(install_dir)/.build/utf8proc								\
						$(install_dir)/.build/libwhich								\
						$(script_dir)/components/languages/$(julia_v).tar.gz
	@export LDFLAGS="$(LDFLAGS) -lz" && generic_build.sh julia $(julia_v) $(install_dir) $(script_dir) VERBOSE=1 LLVM_ASSERTIONS=1 FORCE_ASSERTIONS=1 USE_LLVM_SHLIB=0 USE_SYSTEM_PATCHELF=1 USE_SYSTEM_UTF8PROC=1 USE_SYSTEM_LIBWHICH=1
	@touch $(install_dir)/.build/julia

$(install_dir)/.build/pari-galdata:		$(script_dir)/components/data/pari_galdata-20080411.tar.bz2 
	@rm -rf $(install_dir)/share/pari/galdata
	@mkdir -p $(install_dir)/share/pari
	@tar -xvf $(script_dir)/components/data/pari_galdata-20080411.tar.bz2 && mv -vf data/* $(install_dir)/share/pari/
	@touch $(install_dir)/.build/pari-galdata

$(install_dir)/.build/pari-seadata-small:	$(script_dir)/components/data/pari_seadata_small-20090618.tar.bz2 
	@rm -rf $(install_dir)/share/pari/seadata-small
	@mkdir -p $(install_dir)/share/pari
	@tar -xvf $(script_dir)/components/data/pari_seadata_small-20090618.tar.bz2 && mv -vf data/* $(install_dir)/share/pari/
	@touch $(install_dir)/.build/pari-seadata-small

$(install_dir)/.build/pari-seadata:	$(script_dir)/components/data/seadata.tgz 
	@rm -rf $(install_dir)/share/pari/seadata
	@mkdir -p $(install_dir)/share/pari
	@tar -xvf $(script_dir)/components/data/seadata.tgz && mv -vf data/* $(install_dir)/share/pari/
	@touch $(install_dir)/.build/pari-seadata

$(install_dir)/.build/pari-galpol:	$(script_dir)/components/data/galpol.tgz 
	@rm -rf $(install_dir)/share/pari/galpol
	@mkdir -p $(install_dir)/share/pari
	@tar -xvf $(script_dir)/components/data/galpol.tgz && mv -vf data/* $(install_dir)/share/pari/
	@touch $(install_dir)/.build/pari-galpol

$(install_dir)/.build/pari-elldata:		$(script_dir)/components/data/elldata.tgz
	@rm -rf $(install_dir)/share/pari/elldata
	@mkdir -p $(install_dir)/share/elldata
	@tar -xvf $(script_dir)/components/data/elldata.tgz && mv -vf data/* $(install_dir)/share/pari/
	@touch $(install_dir)/.build/pari-elldata

$(install_dir)/.build/elliptic-curves:		
	@stage.sh ellcurves elliptic_curves-0.8.1 $(install_dir) $(script_dir) 
	@mkdir -p $(install_dir)/share/ellcurves
	@pushd elliptic_curves-0.8.1 ; SAGE_SHARE=$(install_dir)/share/ python3 ./install.py ; popd
	@touch $(install_dir)/.build/elliptic-curves

$(install_dir)/.build/pari:			$(install_dir)/.build/pari-galpol							\
						$(install_dir)/.build/pari-elldata 							\
						$(install_dir)/.build/pari-galdata 							\
						$(install_dir)/.build/pari-seadata 							\
						$(script_dir)/components/libraries/pari-2.17.2.tar.gz 
	@stage.sh pari pari-2.17.2 $(install_dir) $(script_dir) --with-readline=$(install_dir) 
	@pushd pari-2.17.2 && ./Configure --prefix=$(install_dir) --datadir=$(install_dir)/share/pari --with-runtime-perl=$(install_dir)/bin/perl --mt=pthread --kernel=gmp --graphic=none && make install && popd && rm -rf *
	@touch $(install_dir)/.build/pari

$(install_dir)/.build/cliquer:			$(script_dir)/components/libraries/cliquer-1.22.tar.gz
	@generic_build.sh cliquer cliquer-1.22 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/cliquer


$(install_dir)/.build/h5py:			$(install_dir)/.build/hdf5								\
						$(script_dir)/components/python/h5py-3.14.0.tar.gz
	@stage.sh h5py h5py-3.14.0 $(install_dir) $(script_dir) 
	@pushd h5py-3.14.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check . && popd && rm -rf *
	@touch $(install_dir)/.build/h5py

$(install_dir)/.build/hdf5:			
	@generic_build.sh hdf5 hdf5-1.14.6 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/hdf5

$(install_dir)/.build/hdf5-p2:		
	@stage.sh hdf5 $(hdf5_v) $(install_dir) $(script_dir) 
	@mkdir -p $(hdf5_v)/build
	@LDFLAGS="$(LDFLAGS) -lmpi" pushd $(hdf5_v)/build && cmake -DCMAKE_VERBOSE_MAKEFILE=ON  -DCMAKE_INSTALL_PREFIX=$(install_dir) 	\
						HDF5_ENABLE_HDFS=ON 									\
						HDF5_ENABLE_PARALLEL=ON 								\
						HDF5_ENABLE_SUBFILING_VFD=ON								\
						HDF5_ENABLE_THREADSAFE=ON								\
						HDF5_ENABLE_MAP_API=ON									\
						HDF5_BUILD_PARALLEL_TOOLS=ON								\
						HDF5_ENABLE_PLUGIN_SUPPORT=ON								\
						HDF5_BUILD_CPP_LIB=ON									\
						HDF5_BUILD_JAVA=ON									\
						ALLOW_UNSUPPORTED=ON ..
	@LDFLAGS="$(LDFLAGS) -lmpi" pushd $(hdf5_v)/build && make V=1 && make install
	@rm -rf *
	@touch $(install_dir)/.build/hdf5-p2

$(install_dir)/.build/gc:			$(script_dir)/components/libraries/gc-8.2.8.tar.gz
	@generic_build.sh gc gc-8.2.8 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/gc

$(install_dir)/.build/linbox:			
	@generic_build.sh linbox $(linbox_v) $(install_dir) $(script_dir) --enable-shared --disable-static --with-default=$(install_dir)
	@touch $(install_dir)/.build/linbox

$(install_dir)/.build/gf2x:			$(script_dir)/components/libraries/gf2x-1.3.0.tar.gz
	@generic_build.sh gf2x gf2x-1.3.0 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/gf2x

$(install_dir)/.build/givaro:			
	@generic_build.sh givaro givaro-4.2.1 $(install_dir) $(script_dir) --enable-shared  --disable-static
	@touch $(install_dir)/.build/givaro

$(install_dir)/.build/gsl:			$(script_dir)/components/libraries/gsl-2.7.1.tar.gz
	@generic_build.sh gsl gsl-2.7.1 $(install_dir) $(script_dir) -enable-shared
	@touch $(install_dir)/.build/gsl

$(install_dir)/.build/fflas-ffpack:		$(install_dir)/.build/givaro 
	@generic_build.sh fflas-ffpack fflas-ffpack-2.5.0 $(install_dir) $(script_dir) --with-default=$(install_dir) -enable-shared --disable-static  --enable-precompilation --disable-maintainer-mode --disable-dependency-tracking --disable-avx512f --disable-avx512vl --disable-avx512dq --disable-fma --disable-fma4
	@touch $(install_dir)/.build/fflas-ffpack

$(install_dir)/.build/flint:			$(script_dir)/components/libraries/flint-3.1.3.tar.gz
	@generic_build.sh flint flint-3.1.3 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/flint

$(install_dir)/.build/ntl:			$(script_dir)/components/libraries/ntl-11.5.1.tar.gz
	@stage.sh ntl ntl-11.5.1 $(install_dir) $(script_dir)
	@pushd ntl-11.5.1/src && export CPPFLAGS=-I$(install_dir)/include && ./configure DEF_PREFIX=$(install_dir) PREFIX=$(install_dir) SHARED=on && make && make install && popd && rm -rf *
	@touch $(install_dir)/.build/ntl

$(install_dir)/.build/4ti2:			$(script_dir)/components/libraries/$(4ti2_v).tar.gz
	@generic_build.sh 4ti2 $(4ti2_v) $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/4ti2

$(install_dir)/.build/xterm:			$(install_dir)/.build/x11								\
						$(install_dir)/.build/luit 								\
						$(install_dir)/.build/dejavu-fonts							\
						$(script_dir)/components/utilities/$(xterm_v).tar.gz
	@linux.sh generic_build.sh xterm $(xterm_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/xterm

$(install_dir)/.build/luit:			$(script_dir)/components/libraries/$(luit_v).tar.gz
	@generic_build.sh luit $(luit_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/luit

$(install_dir)/.build/libmicrohttpd:		$(script_dir)/components/libraries/$(libmicrohttpd_v).tar.gz
	@generic_build.sh libmicrohttpd $(libmicrohttpd_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/libmicrohttpd

$(install_dir)/.build/m4rie:			$(script_dir)/components/libraries/$(m4rie_v).tar.gz
	@generic_build.sh m4rie $(m4rie_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/m4rie

$(install_dir)/.build/fplll:			$(script_dir)/components/libraries/$(fplll_v).tar.gz
	@generic_build.sh fplll $(fplll_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/fplll

$(install_dir)/.build/gap:			
	$(script_dir)/scripts/stage.sh gap gap-4.14.0 $(install_dir) $(script_dir)
	@pushd gap-4.14.0 ; ./autogen.sh ; ./configure --prefix=$(install_dir) --disable-static ; popd
	@pushd gap-4.14.0 ; make V=1 all && make V=1 install ; popd
	@mkdir -p $(install_dir)/lib/gap/pkg
	@cp -R -pv  gap-4.14.0/pkg/gapdoc $(install_dir)/lib/gap/pkg
	@cp -R -pv  gap-4.14.0/pkg/primgrp $(install_dir)/lib/gap/pkg
	@cp -R -pv  gap-4.14.0/pkg/smallgrp $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/transgrp $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/alnuth $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/atlasrep $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/autpgrp $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/crisp $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/ctbllib $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/factint $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/fga $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/irredsol $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/laguna $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/polenta $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/polycyclic $(install_dir)/lib/gap/pkg
	@cp -R -pv  gap-4.14.0/pkg/resclasses $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/sophus $(install_dir)/lib/gap/pkg 
	@cp -R -pv  gap-4.14.0/pkg/tomlib $(install_dir)/lib/gap/pkg 
	@rm -rf *
	@touch $(install_dir)/.build/gap

$(install_dir)/.build/gengetopt:		$(script_dir)/components/libraries/gengetopt-2.23.tar.gz
	@generic_build.sh gengetopt gengetopt-2.23 $(install_dir) $(script_dir) --disable-static
	@touch $(install_dir)/.build/gengetopt

$(install_dir)/.build/gfan:			$(install_dir)/.build/gmp								\
						$(script_dir)/components/libraries/gfan0.6.2.tar.gz
	@linux.sh generic_build.sh gfan gfan0.6.2 $(install_dir) $(script_dir) PREFIX=$(install_dir)
	@touch $(install_dir)/.build/gfan

$(install_dir)/.build/glpk:			$(script_dir)/components/libraries/glpk-5.0.tar.gz
	@generic_build.sh glpk glpk-5.0 $(install_dir) $(script_dir) PREFIX=$(install_dir)
	@touch $(install_dir)/.build/glpk

$(install_dir)/.build/gnulib:			
	@stage.sh gnulib $(gnulib_v) $(install_dir) $(script_dir)
	@pushd $(gnulib_v) && ./gnulib-tool --create-testdir  --without-tests --dir=$(build_dir)/build && popd && pushd build && ./configure --prefix=$(install_dir) && make && make install && popd && rm -rf *
	@touch $(install_dir)/.build/gnulib

$(install_dir)/.build/liblrcalc:		$(script_dir)/components/libraries/lrcalc-2.1.tar.gz
	@generic_build.sh liblrcalc lrcalc-2.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/liblrcalc

$(install_dir)/.build/maxima:			$(script_dir)/components/libraries/maxima-5.47.0.tar.gz
	@generic_build.sh maxima maxima-5.47.0 $(install_dir) $(script_dir) --disable-static --disable-maintainer-mode --disable-dependency-tracking --enable-ecl git_found=false
	@touch $(install_dir)/.build/maxima

$(install_dir)/.build/mpfi:			$(script_dir)/components/libraries/mpfi-1.5.2.tar.gz
	@generic_build.sh mpfi mpfi-1.5.2 $(install_dir) $(script_dir) --disable-static --disable-maintainer-mode --disable-dependency-tracking --enable-ecl git_found=false
	@touch $(install_dir)/.build/mpfi

$(install_dir)/.build/nauty2:			$(script_dir)/components/libraries/nauty2.8.9.tar.gz
	@generic_build.sh nauty2 nauty2.8.9 $(install_dir) $(script_dir) --enable-static 
	@touch $(install_dir)/.build/nauty2

$(install_dir)/.build/palp:			$(script_dir)/components/libraries/palp-2.11.tar.gz
	@generic_build.sh palp palp-2.11 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/palp

$(install_dir)/.build/patchelf:			$(script_dir)/components/libraries/patchelf-0.13.1.tar.gz
	@linux.sh generic_build.sh patchelf patchelf-0.13.1 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/patchelf

$(install_dir)/.build/planarity:		$(script_dir)/components/libraries/planarity-3.0.1.0.tar.gz
	@generic_build.sh planarity planarity-3.0.1.0 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/planarity

$(install_dir)/.build/ppl:			$(script_dir)/components/libraries/ppl-1.2.tar.gz
	@generic_build.sh ppl ppl-1.2 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/ppl

$(install_dir)/.build/polytopes_db:		$(script_dir)/components/libraries/polytopes_db-20170220.tar.gz
	@skip.sh generic_build.sh polytopes_db polytopes_db-20170220 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/polytopes_db

$(install_dir)/.build/primesieve:		$(script_dir)/components/libraries/primesieve-12.4.tar.gz
	@generic_build.sh primesieve primesieve-12.4 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/primesieve

$(install_dir)/.build/primecount:		$(script_dir)/components/libraries/primecount-7.14.tar.gz
	@generic_build.sh primecount primecount-7.14 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/primecount

$(install_dir)/.build/qhull:			$(script_dir)/components/libraries/qhull-8.0.2.tar.gz
	@generic_build.sh qhull qhull-8.0.2 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/qhull

$(install_dir)/.build/rw:			$(install_dir)/.build/igraph 								\
						$(install_dir)/.build/igraph-py								\
						$(script_dir)/components/libraries/rw-0.9.tar.gz
	@generic_build.sh rw rw-0.9 $(install_dir) $(script_dir) --enable-executable=no
	@touch $(install_dir)/.build/rw

$(install_dir)/.build/igraph:			$(script_dir)/components/libraries/igraph-0.10.15.tar.gz
	@linux.sh generic_build.sh igraph igraph-0.10.15 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/igraph


#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/.build/suitesparse:		$(install_dir)/.build/mpfr					
	@generic_build.sh suitesparse suitesparse-7.10.3 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/suitesparse

$(install_dir)/.build/admcycles:		$(script_dir)/components/python/$(admcycles_v).tar.gz
	@stage.sh admcycles $(admcycles_v) $(install_dir) $(script_dir) 
	@pushd $(admcycles_v) && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/admcycles

$(install_dir)/.build/alabaster:		$(script_dir)/components/python/alabaster-1.0.0.tar.gz
	@stage.sh admcycles alabaster-1.0.0 $(install_dir) $(script_dir) 
	@pushd alabaster-1.0.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/alabaster

$(install_dir)/.build/idna:			$(script_dir)/components/python/idna-3.10.tar.gz
	@stage.sh idna idna-3.10 $(install_dir) $(script_dir) 
	@pushd idna-3.10 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/idna

$(install_dir)/.build/sniffio:			$(script_dir)/components/python/sniffio-1.3.1.tar.gz
	@stage.sh sniffio sniffio-1.3.1 $(install_dir) $(script_dir) 
	@pushd sniffio-1.3.1 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/sniffio

$(install_dir)/.build/exceptiongroup:		$(script_dir)/components/python/exceptiongroup-1.3.0.tar.gz
	@stage.sh exceptiongroup exceptiongroup-1.3.0 $(install_dir) $(script_dir) 
	@pushd exceptiongroup-1.3.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/exceptiongroup

$(install_dir)/.build/anyio:			$(script_dir)/components/python/anyio-4.9.0.tar.gz
	@stage.sh anyio anyio-4.9.0 $(install_dir) $(script_dir) 
	@pushd anyio-4.9.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/anyio

$(install_dir)/.build/appdirs:			$(script_dir)/components/python/appdirs-1.4.4.tar.gz
	@stage.sh appdirs appdirs-1.4.4 $(install_dir) $(script_dir) 
	@pushd appdirs-1.4.4 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/appdirs

$(install_dir)/.build/appnope:			$(script_dir)/components/python/appnope-0.1.4.tar.gz
	@stage.sh appnope appnope-0.1.4 $(install_dir) $(script_dir) 
	@pushd appnope-0.1.4 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/appnope

$(install_dir)/.build/argon2-cffi-bindings:	$(script_dir)/components/python/argon2-cffi-bindings-21.2.0.tar.gz
	@stage.sh argon2-cffi-bindings argon2-cffi-bindings-21.2.0 $(install_dir) $(script_dir) 
	@pushd argon2-cffi-bindings-21.2.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/argon2-cffi-bindings

$(install_dir)/.build/argon2_cffi:	$(script_dir)/components/python/argon2_cffi-25.1.0.tar.gz
	@stage.sh argon2_cffi argon2_cffi-25.1.0 $(install_dir) $(script_dir) 
	@pushd argon2_cffi-25.1.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/argon2_cffi

$(install_dir)/.build/flit_core:	$(script_dir)/components/python/flit_core-3.12.0.tar.gz
	@stage.sh flit_core flit_core-3.12.0 $(install_dir) $(script_dir) 
	@pushd flit_core-3.12.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/flit_core

$(install_dir)/.build/cffi:		$(script_dir)/components/python/cffi-1.17.1.tar.gz
	@stage.sh cffi cffi-1.17.1 $(install_dir) $(script_dir) 
	@pushd cffi-1.17.1 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/cffi

$(install_dir)/.build/types_python_dateutil:	$(script_dir)/components/python/types_python_dateutil-2.9.0.20250516.tar.gz
	@stage.sh types_python_dateutil types_python_dateutil-2.9.0.20250516 $(install_dir) $(script_dir) 
	@pushd types_python_dateutil-2.9.0.20250516 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/types_python_dateutil

$(install_dir)/.build/six:			$(script_dir)/components/python/six-1.17.0.tar.gz
	@stage.sh six six-1.17.0 $(install_dir) $(script_dir) 
	@pushd six-1.17.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/six

$(install_dir)/.build/python-dateutil:		$(script_dir)/components/python/python-dateutil-2.9.0.post0.tar.gz
	@stage.sh python-dateutil python-dateutil-2.9.0.post0 $(install_dir) $(script_dir) 
	@pushd python-dateutil-2.9.0.post0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/python-dateutil

$(install_dir)/.build/arrow:		$(script_dir)/components/python/arrow-1.3.0.tar.gz
	@stage.sh arrow arrow-1.3.0 $(install_dir) $(script_dir) 
	@pushd arrow-1.3.0 && python3 -m pip install --no-deps --ignore-installed --compile --disable-pip-version-check .  && popd && rm -rf *
	@touch $(install_dir)/.build/arrow

$(install_dir)/.build/sage:			$(install_dir)/.build/patch								\
						$(install_dir)/.build/mpc								\
						$(install_dir)/.build/mpfr								\
						$(install_dir)/.build/gmp								\
						$(install_dir)/.build/isl								\
						$(install_dir)/.build/boost								\
						$(install_dir)/.build/m4ri								\
						$(install_dir)/.build/BRiAl								\
						$(install_dir)/.build/cddlib								\
						$(install_dir)/.build/cliquer								\
						$(install_dir)/.build/libatomic_ops							\
						$(install_dir)/.build/gc								\
						$(install_dir)/.build/ecl								\
						$(install_dir)/.build/pari								\
						$(install_dir)/.build/gf2x								\
						$(if $(os_linux), $(install_dir)/.build/ntl)						\
						$(install_dir)/.build/flint								\
						$(install_dir)/.build/eclib								\
						$(install_dir)/.build/ecm								\
						$(install_dir)/.build/elliptic-curves							\
						$(install_dir)/.build/givaro								\
						$(install_dir)/.build/gsl								\
						$(install_dir)/.build/gengetopt								\
						$(install_dir)/.build/gfan								\
						$(install_dir)/.build/glpk								\
						$(if $(os_linux), $(install_dir)/.build/gnulib)						\
						$(install_dir)/.build/openblas								\
						$(install_dir)/.build/lapack								\
						$(install_dir)/.build/clapack								\
						$(install_dir)/.build/hatchling								\
						$(install_dir)/.build/jupyter_client							\
						$(install_dir)/.build/jupyter_core							\
						$(install_dir)/.build/platformdirs							\
						$(install_dir)/.build/scipy								\
						$(install_dir)/.build/m4rie								\
						$(install_dir)/.build/fflas-ffpack							\
						$(install_dir)/.build/fplll								\
						$(install_dir)/.build/gap								\
						$(install_dir)/.build/linbox								\
						$(install_dir)/.build/4ti2								\
																	\
						$(install_dir)/.build/maxima								\
						$(install_dir)/.build/suitesparse							\
						$(install_dir)/.build/cvxopt								\
																	\
						$(install_dir)/.build/liblrcalc								\
						$(install_dir)/.build/mpfi								\
						$(install_dir)/.build/nauty2								\
						$(install_dir)/.build/palp								\
						$(install_dir)/.build/patchelf								\
						$(install_dir)/.build/planarity								\
						$(install_dir)/.build/polytopes_db							\
						$(install_dir)/.build/ppl								\
						$(install_dir)/.build/primesieve							\
						$(install_dir)/.build/primecount							\
						$(install_dir)/.build/qhull								\
						$(if $(os_linux), $(install_dir)/.build/rw)
	@mkdir -p $(install_dir)/opt/sage/var/lib/sage/installed
	@touch $(install_dir)/opt/sage/var/lib/sage/installed/elliptic_curves-0.8.1				
	@linux.sh generic_build.sh sage sage-10.6 $(install_dir)/opt/sage $(script_dir) --disable-doc 					\
		--enable-system-site-packages 												\
		--enable-experimental-packages		  										\
		--disable-download-from-upstream-url											\
		--with-system-givaro=yes												\
		--with-python=$(install_dir)/bin/python3 										\
		--with-system-curl=force  --with-libcurl=$(install_dir)
	@touch $(install_dir)/.build/sage

$(install_dir)/.build/nodejs:			$(install_dir)/.build/nghttp2 								\
						$(install_dir)/.build/nghttp3								\
						$(install_dir)/.build/libuv								\
						$(install_dir)/.build/libcares
	@mv $(install_dir)/bin/libtool $(install_dir)/bin/libtool-bak 
	@generic_build.sh nodejs $(nodejs_v) $(install_dir) $(script_dir) 
	@mv $(install_dir)/bin/libtool-bak $(install_dir)/bin/libtool
	@touch $(install_dir)/.build/nodejs

$(install_dir)/.build/couchdb:			$(script_dir)/components/services/couchdb-3.5.0.tar.gz
	@stage.sh couchdb couchdb-3.5.0 $(install_dir) $(script_dir)
	@pushd couchdb-3.5.0 ; ./configure --disable-spidermonkey --js-engine=quickjs ; make V=1 all ; make V=1 release ; popd
	@cp -rv couchdb-3.5.0/rel/couchdb $(install_dir)/lib
	@rm -rf *
	@touch $(install_dir)/.build/couchdb

#$(install_dir)/.build/bazel:		
#	@stage.sh bazel bazel-8.3.1 $(install_dir) $(script_dir)
#	PATH="$(binaries):$(binaries)/jdk-21/bin:$(PATH)" && pushd bazel-8.3.1 ; echo $(binaries) && bazel build //src:bazel --stamp --embed_label=8.3.1 && cp -f bazel-bin/src/bazel $(install_dir)/bin && popd
#	@rm -rf *
#	@touch $(install_dir)/.build/bazel

$(install_dir)/.build/beartype:			$(script_dir)/components/python/$(beartype_v).tar.gz
	$(call pipmk,beartype,$(beartype_v),$(install_dir),$(script_dir))

$(install_dir)/.build/license_expression:	$(script_dir)/components/python/$(license_expression_v).tar.gz
	$(call pipmk,license_expression,$(license_expression_v),$(install_dir),$(script_dir))

$(install_dir)/.build/rdflib:			$(script_dir)/components/python/$(rdflib_v).tar.gz
	$(call pipmk,rdflib,$(rdflib_v),$(install_dir),$(script_dir))

$(install_dir)/.build/uritools:			$(script_dir)/components/python/$(uritools_v).tar.gz
	$(call pipmk,uritools,$(uritools_v),$(install_dir),$(script_dir))

$(install_dir)/.build/xmltodict:		$(script_dir)/components/python/$(xmltodict_v).tar.gz
	$(call pipmk,xmltodict,$(xmltodict_v),$(install_dir),$(script_dir))

$(install_dir)/.build/boolean_py:		$(script_dir)/components/python/$(boolean_py_v).tar.gz
	$(call pipmk,boolean_py,$(boolean_py_v),$(install_dir),$(script_dir))

$(install_dir)/.build/semantic_version:		$(install_dir)/.build/boolean_py							\
						$(script_dir)/components/python/$(semantic_version_v).tar.gz
	$(call pipmk,semantic_version,$(semantic_version_v),$(install_dir),$(script_dir))

$(install_dir)/.build/spdx:			$(install_dir)/.build/beartype								\
						$(install_dir)/.build/license_expression						\
						$(install_dir)/.build/rdflib								\
						$(install_dir)/.build/uritools								\
						$(install_dir)/.build/xmltodict								\
						$(install_dir)/.build/semantic_version							\
						$(script_dir)/components/python/spdx-2.5.1.tar.gz
	$(call pipmk,spdx,spdx-2.5.1,$(install_dir),$(script_dir))

$(install_dir)/.build/clitools:			$(script_dir)/components/python/CliTools-0.2.tar.gz
	$(call pipmk,clitools,CliTools-0.2,$(install_dir),$(script_dir))

$(install_dir)/.build/spdx-tools:		$(script_dir)/components/python/spdx-tools-0.8.3.tar.gz
	$(call pipmk,spdx-tools,spdx-tools-0.8.3,$(install_dir),$(script_dir))

$(install_dir)/.build/virtualenv:		$(install_dir)/.build/filelock								\
						$(script_dir)/components/python/virtualenv-20.34.0.tar.gz
	$(call pipmk,virtualenv,virtualenv-20.34.0,$(install_dir),$(script_dir))

$(install_dir)/.build/filelock:			$(script_dir)/components/python/filelock-3.19.1.tar.gz
	$(call pipmk,filelock,filelock-3.19.1,$(install_dir),$(script_dir))

$(install_dir)/.build/distlib:			$(script_dir)/components/python/distlib-0.4.0.tar.gz
	$(call pipmk,distlib,distlib-0.4.0,$(install_dir),$(script_dir))

$(install_dir)/.build/qt5:			$(install_dir)/.build/x11								\
						$(install_dir)/.build/spdx								\
						$(install_dir)/.build/spdx-tools							\
						$(script_dir)/components/libraries/$(qt5_v).tar.gz
	@generic_build.sh qt5 $(qt5_v) $(install_dir) $(script_dir) -opensource -confirm-license -c++std c++17 -skip qtlocation
	@touch $(install_dir)/.build/qt5

$(install_dir)/.build/qt6:			$(install_dir)/.build/x11								\
						$(install_dir)/.build/spdx								\
						$(install_dir)/.build/spdx-tools							\
						$(script_dir)/components/libraries/$(qt6_v).tar.gz
	@stage.sh qt6 $(qt6_v) $(install_dir) $(script_dir)
	@pushd $(qt6_v) && ./configure --prefix=$(install_dir) -opensource -confirm-license && popd
	@pushd $(qt6_v) && cmake --build . && cmake --install . && popd
	@rm -rf *
	@touch $(install_dir)/.build/qt6

$(install_dir)/.build/tensorboard:		$(install_dir)/.build/markdown								\
						$(install_dir)/.build/virtualenv							\
						$(install_dir)/.build/distlib								\
						$(install_dir)/.build/openssl-probe							\
						$(script_dir)/components/utilities/$(tensorboard_v).tar.gz
		@stage.sh tensorboard $(tensorboard_v) $(install_dir) $(script_dir)
		@chmod 0755 $(HOME)/.cache/bazel
		@chmod 0755 -R $(HOME)/.cache/bazel/
		@$(SUDO) rm -rf $(HOME)/.cache
		@rm -f $(install_dir)/lib/lib
		@export PATH="$(binaries):$(PATH)" &&						 					\
			export JDK_HOME=$(install_dir) &&										\
			pushd $(tensorboard_v) && 											\
			bazel run //tensorboard/pip_package:build_pip_package $(build_dir)/$(tensorboard_v)				\
		&& popd
		@pushd $(tensorboard_v) && pip install --no-deps $(tensorboard_v)-py3-none-any.whl && popd
		@chmod 0755 $(HOME)/.cache/bazel
		@chmod 0755 -R $(HOME)/.cache/bazel/
		@$(SUDO) rm -rf $(HOME)/.cache
#		@export PATH="$(binaries):$(PATH)" &&						 					\
#			export JDK_HOME=$(install_dir) &&										\
#			pushd $(tensorboard_v) &&	 										\
#			bazel run //tensorboard/data/server			 							\
#		&& popd
		pushd $(tensorboard_v) && 												\
			python3 tensorboard/data/server/pip_package/build.py --out-dir $(build_dir)/$(tensorboard_v) --universal && 	\
		popd
		pushd $(tensorboard_v) && pip install --no-deps $(tensorboard_data_server_v)-py3-none-any.whl && popd
		@rm -rf *
		@touch $(install_dir)/.build/tensorboard

$(install_dir)/.build/tensorflow:		$(install_dir)/.build/hdf5								\
						$(install_dir)/.build/h5py								\
						$(install_dir)/.build/keras								\
						$(install_dir)/.build/patchelf								\
						$(install_dir)/.build/google-pasta							\
						$(install_dir)/.build/libclang								\
						$(install_dir)/.build/grpcio								\
						$(install_dir)/.build/flatbuffers							\
						$(install_dir)/.build/astunparse							\
						$(install_dir)/.build/absl_py								\
						$(install_dir)/.build/asyncio								\
						$(install_dir)/.build/wrapt								\
						$(install_dir)/.build/termcolor								\
						$(install_dir)/.build/protobuf								\
						$(install_dir)/.build/opt_einsum							\
						$(install_dir)/.build/ml_dtypes								
	@stage.sh tensorflow $(tensorflow_v) $(install_dir) $(script_dir)								
	@chmod 0755 $(HOME)/.cache/bazel
	@chmod 0755 -R $(HOME)/.cache/bazel/
	@$(SUDO) rm -rf $(HOME)/.cache
	@export PATH="$(binaries):$(binaries)/jdk-21/bin:$(binaries)/cuda-12.8/bin:$(PATH)" && 						\
		export CC=$(install_dir)/bin/gcc && export CXX=$(install_dir)/bin/g++ &&						\
		pushd $(tensorflow_v) && 												\
				TF_NEED_CLANG=False 											\
				TF_NEED_CUDA=False 											\
				TF_CUDA_CLANG=False											\
				TF_NEED_TF_NEED_ROCM=False										\
				TF_SET_ANDROID_WORKSPACE=False 										\
				TF_CONFIGURE_IOS=False											\
				HERMETIC_CUDA_VERSION=12.8.0										\
				HERMETIC_CUDNN_VERSION=9.11.0.98									\
				HERMETIC_CUDA_COMPUTE_CAPABILITIES=8.9,12.0								\
				PYTHON_BIN_PATH=$(install_dir)/bin/python3 								\
				GCC_HOST_COMPILER_PATH=$(install_dir)/bin/gcc								\
				LOCAL_CUDA_PATH=$(binaries)/cuda-12.8/bin								\
				LOCAL_CUDNN_PATH=$(binaries)/cuda-12.8									\
				LOCAL_NCCL_PATH=$(binaries)/cuda-12.8									\
				PYTHON_LIB_PATH=$(install_dir)/lib/python3.13/site-packages 						\
				CLANG_CUDA_COMPILER_PATH=$(install_dir)/bin/clang							\
				TF_NEED_ROCM=False 											\
				CLANG_COMPILER_PATH=$(install_dir)/bin/clang 								\
				CC_OPT_FLAGS="-Wno-sign-compare -Wno-incompatible-pointer-types" 					\
				./configure 												\
		&& popd
	@export PATH="$(binaries):$(binaries)/jdk-21/bin:$(binaries)/cuda-12.8/bin:$(PATH)" && 						\
		export CC=$(install_dir)/bin/gcc && export CXX=$(install_dir)/bin/g++ &&						\
		pushd $(tensorflow_v) &&									 			\
		bazel fetch //tensorflow/tools/pip_package:wheel 									\
				--repo_env=HERMETIC_PYTHON_VERSION=3.12									\
		&& popd
	@export PATH="$(binaries):$(binaries)/jdk-21/bin:$(binaries)/cuda-12.8/bin:$(PATH)" && 						\
		export CC=$(install_dir)/bin/gcc && export CXX=$(install_dir)/bin/g++ &&						\
		pushd $(tensorflow_v) &&									 			\
		bazel build //tensorflow/tools/pip_package:wheel 									\
				--action_env=LD_LIBRARY_PATH=$(install_dir)/lib 							\
				--action_env=LDFLAGS="$(LDFLAGS)" 									\
				--repo_env=LD_LIBRARY_PATH=$(install_dir)/lib 								\
				--repo_env=USE_PYWRAP_RULES=1 										\
				--repo_env=WHEEL_NAME=tensorflow 									\
				--repo_env=HERMETIC_PYTHON_VERSION=3.12 								\
				--repo_env=LDFLAGS="$(LDFLAGS)" 									\
				--python_path=$(install_dir)/bin/python3 								\
				--host_action_env=LD_LIBRARY_PATH=$(install_dir)/lib 							\
				--host_action_env=LDFLAGS="$(LDFLAGS)" 									\
				--verbose_failures											\
				--config=opt												\
				--subcommands 												\
				--jobs 6												\
		&& popd 
	@find $(tensorflow_v)/bazel-out/. -name '$(tensorflow_v)-*.whl' -exec pip install --no-deps {} \;
	@test -e $(install_dir)/lib/python3.12/site-packages/tensorflow/THIRD_PARTY_NOTICES.txt
	@rm -rf *
	@touch $(install_dir)/.build/tensorflow

$(install_dir)/.build/libspiro:			$(script_dir)/components/libraries/libspiro-20220722.tar.gz
	@generic_build.sh libspiro libspiro-20220722 $(install_dir) $(script_dir) 
	@touch $(install_dir)/.build/libspiro

$(install_dir)/.build/cairomm:			$(install_dir)/.build/doxygen		
	@linux.sh generic_build.sh cairomm cairomm-1.14.5 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/cairomm

$(install_dir)/.build/glibmm:			
	@skip.sh generic_build.sh glibmm glibmm-2.84.0 $(install_dir) $(script_dir) --build=aarch64-unknown-linux-gnu
	@touch $(install_dir)/.build/glibmm

$(install_dir)/.build/mm-common:			
	@linux.sh generic_build.sh mm-common mm-common-1.0.6-2.1 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/mm-common

$(install_dir)/.build/doxygen:			
	@linux.sh generic_build.sh doxygen $(doxygen_v) $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/doxygen

$(install_dir)/.build/libsigcplusplus:			
	@linux.sh generic_build.sh libsigcplusplus libsigc++-2.12.1 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/libsigcplusplus

$(install_dir)/.build/gtkmm:			$(install_dir)/.build/libsigcplusplus							\
						$(install_dir)/.build/mm-common								\
						$(install_dir)/.build/glibmm								\
						$(install_dir)/.build/cairomm								
	@skip.sh generic_build.sh gtkmm gtkmm-3.24.10 $(install_dir) $(script_dir)
	@touch $(install_dir)/.build/gtkmm

$(install_dir)/.build/fontforge:		$(install_dir)/.build/libspiro 								\
						$(install_dir)/.build/gtkmm								\
						$(install_dir)/.build/perl-io-string
	@linux.sh generic_build.sh fontforge $(fontforge_v) $(install_dir) $(script_dir) ENABLE_DOCS=OFF
	@touch $(install_dir)/.build/fontforge

$(install_dir)/.build/qemu:			
	@linux.sh generic_build.sh qemu $(qemu_v) $(install_dir)/opt/qemu $(script_dir) --sysconfdir=$(install_dir)/etc        		\
	@touch $(install_dir)/.build/qemu

$(install_dir)/.build/samba:			
	@linux.sh generic_build.sh samba $(samba_v) $(install_dir)/opt/samba $(script_dir) 						\
						--sysconfdir=$(install_dir)/etc        							\
						--sysconfdir=$(install_dir)/etc                     	 				\
						--localstatedir=$(install_dir)/var                   					\
						--with-piddir=$(install_dir)/run/samba               					\
						--enable-fhs                           							\
						--without-ad-dc                        							\
						--without-systemd                      							\
						--with-system-mitkrb5                  							\
						--enable-selftest                      							\
						--disable-rpath-install          							\
						--without-ldap										\
						--without-ad-dc
	@touch $(install_dir)/.build/samba




$(install_dir)/.build/dejavu-fonts:		$(install_dir)/.build/fontforge 							\
						$(install_dir)/.build/perl-font-tif 							\
						$(script_dir)/components/libraries/$(dejavu-fonts_v).tar.gz
	@stage.sh dejavu-fonts $(dejavu-fonts_v) $(install_dir) $(script_dir)
	@pushd $(dejavu-fonts_v) && make full-ttf &&											\
		install -v -d -m755 $(install_dir)/share/fonts/dejavu && 								\
		install -v -m644 build/*.ttf $(install_dir)/share/fonts/dejavu && 							\
		fc-cache -v $(install_dir)/share/fonts/dejavu &&									\
		popd 
	@rm -rf *
	@touch $(install_dir)/.build/dejavu-fonts

$(install_dir)/.build/scala2:	
	@stage.sh scala2 $(scala2_v) $(install_dir) $(script_dir)
	@pushd $(scala2_v) && export PATH="$(no_arch)/sbt-1.11.5/bin:$(PATH)" && sbt -Dsbt.global.base=$(install_dir)/.sbt dist/mkBin && popd
	@rm -rf *
	@touch $(install_dir)/.build/scala2

$(install_dir)/.build/scala3:	
	@stage.sh scala3 $(scala3_v) $(install_dir) $(script_dir)
	@pushd $(scala3_v) && export PATH="$(no_arch)/sbt-1.11.5/bin:$(PATH)" && sbt -Dsbt.global.base=$(install_dir)/.sbt dist/Universal/packageBin && popd
	@rm -rf *
	@touch $(install_dir)/.build/scala3

$(install_dir)/.build/graalvm:	
	@stage.sh graalvm $(graalvm_v) $(install_dir) $(script_dir)
	@pushd $(graalvm_v) && echo JAVA_HOME=$(install_dir) >> graal/sulong/mx.sulong/env && popd
	@pushd $(graalvm_v) && echo Y > test &&	popd		
	@pushd $(graalvm_v) && export PATH="$(build_dir)/$(graalvm_v)/mx:$(PATH)" && mx fetch-jdk --jdk-id labsjdk-ce-latest --to $(install_dir)/.mx/jdks -A < test && popd
	@pushd $(graalvm_v)/graal/vm && export PATH="$(build_dir)/$(graalvm_v)/mx:$(PATH)" && export JAVA_HOME=$(install_dir)/.mx/jdks/labsjdk-ce-latest && mx --dynamicimports /sulong,/substratevm,/tools build
	@rm -rf *
	@touch $(install_dir)/.build/graalvm

$(install_dir)/.build/oneDNN:	
	@generic_build.sh oneDNN $(oneDNN_v) $(install_dir) $(script_dir) ENABLE_DOCS=OFF
	@rm -rf *
	@touch $(install_dir)/.build/oneDNN

$(install_dir)/.build/libfabric:	
	@generic_build.sh libfabric $(libfabric_v) $(install_dir) $(script_dir) 
	@rm -rf *
	@touch $(install_dir)/.build/libfabric

$(install_dir)/.build/oneTBB:	
	@generic_build.sh oneTBB $(oneTBB_v) $(install_dir) $(script_dir) ENABLE_DOCS=OFF
	@rm -rf *
	@touch $(install_dir)/.build/oneTBB

$(install_dir)/.build/oneMath:	
	@generic_build.sh oneMath $(oneMath_v) $(install_dir) $(script_dir) 								\
						-DCMAKE_C_COMPILER=gcc 									\
						-DCMAKE_CXX_COMPILER=g++ 								\
						-DENABLE_MKLCPU_BACKEND=FALSE								\
						-DENABLE_MKLGPU_BACKEND=FALSE										
	@rm -rf *
	@touch $(install_dir)/.build/oneMath

$(install_dir)/.build/oneDAL:	
	@$(SUDO) rm -rf ~/.cache
	@rm -f $(install_dir)/lib/lib
	@stage.sh oneDAL $(oneDAL_v) $(install_dir) $(script_dir)
	@pushd $(oneDAL_v) && RELEASEDIR=$(build_dir)/release OPENBLASROOT=$(install_dir) MKLROOT=/opt/intel/oneapi/2025.2 TBBROOT=$(install_dir) PATH="/opt/intel/oneapi/2025.2/bin:$(PATH)"  make _release
	@cp -aRv release/daal/latest/* $(install_dir)/
	@rm -rf *
	@touch $(install_dir)/.build/oneDAL

$(install_dir)/.build/oneDPL:	
	@generic_build.sh oneDPL $(oneDPL_v) $(install_dir) $(script_dir) ENABLE_DOCS=OFF
	@rm -rf *
	@touch $(install_dir)/.build/oneDPL

$(install_dir)/.build/oneCCL:			$(install_dir)/.build/libfabric					
	@generic_build.sh oneCCL $(oneCCL_v) $(install_dir) $(script_dir) ENABLE_DOCS=OFF 						\
						-DCMAKE_C_COMPILER=gcc 									\
						-DCMAKE_CXX_COMPILER=g++ 								\
						-DCCL_CONFIGURATION=Release 								\
						-DCCL_ATL_TRANSPORT=mpi 								\
						-DONEDNN_AARCH64_USE_ACL=OFF								\
						-DLIBFABRIC_DIR=$(install_dir)								\
						-DENABLE_STUB_BACKEND=FALSE								
	@rm -rf *
	@touch $(install_dir)/.build/oneCCL



#---------------------------------------------------------------------------------------------------------------------------------------
# Java 
#
$(install_dir)/.build/maven:	
	@stage.sh maven $(maven_v) $(install_dir) $(script_dir)
	@pushd $(maven_v) &&														\
		JAVA_HOME=$(binaries)/jdk-21 PATH="$(binaries)/jdk-21/bin:$(PATH)" $(script_dir)/bin/no-arch/maven/bin/mvn install 	\
	&& popd
	@pushd $(maven_v) &&														\
		JAVA_HOME=$(binaries)/jdk-21 PATH="$(binaries)/jdk-21/bin:$(PATH)" $(script_dir)/bin/no-arch/maven/bin/mvn	 	\
						-DdistributionTargetDir="$(install_dir)/opt/$(maven_v)" install				\
	&& popd
	@rm -rf *
	@touch $(install_dir)/.build/maven

$(install_dir)/.build/bdb:	
	@stage.sh bdb $(db_v) $(install_dir) $(script_dir)
	@pushd $(db_v)/build_unix && ../dist/configure --prefix=$(install_dir)      							\
						--enable-compat185 									\
						--enable-dbm       									\
						--disable-static &&  									\
						make && make install && popd
	@rm -rf *
	@touch $(install_dir)/.build/bdb

$(install_dir)/.build/postfix:			$(install_dir)/.build/rpcsvc
	@stage.sh postfix $(postfix_v) $(install_dir) $(script_dir)
	@pushd $(postfix_v) && unset LD_LIBRARY_PATH make -f Makefile.init makefiles shared=yes shlib_directory=$(install_dir)/lib/postfix && make && popd
	@rm -rf *
	@touch $(install_dir)/.build/postfix

$(install_dir)/.build/acryl_datahub:		$(script_dir)/components/python/$(acryl_datahub_v).tar.gz
	$(call pipmk,acryl_datahub,$(acryl_datahub_v),$(install_dir),$(script_dir))

$(install_dir)/.build/datahub:			$(install_dir)/.build/acryl_datahub 
	@stage.sh datahub $(datahub_v) $(install_dir) $(script_dir)
	@pushd $(datahub_v) && JAVA_HOME=$(binaries)/jdk-17 PATH="$(binaries)/jdk-17/bin:$(script_dir)/bin/no-arch/gradle/bin:$(PATH)" gradle build -x test		\
						-x :metadata-ingestion:installDevTest 							\
						-x :docker:generateQuickstartComposeConfig						\
		&& popd
	test -e foobar
	@rm -rf *
	@touch $(install_dir)/.build/datahub

$(install_dir)/.build/kotlin:	
	@stage.sh kotlin $(kotlin_v) $(install_dir) $(script_dir)
	@pushd $(kotlin_v) && export JAVA_HOME=$(binaries)/jdk-21 && PATH="$(binaries)/jdk-21/bin:$(script_dir)/bin/no-arch/gradle/bin:$(PATH)" gradle build && popd
	test -e foobar
	@rm -rf *
	@touch $(install_dir)/.build/kotlin


$(install_dir)/.build/pvm3:	
	@stage.sh pvm3 $(pvm3_v) $(install_dir) $(script_dir)
	test -e foobar
	@rm -rf *
	@touch $(install_dir)/.build/kotlin

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/.build/x11:			$(install_dir)/.build/gettext								\
						$(install_dir)/.build/wayland								\
						$(install_dir)/.build/wayland-protocols							\
						$(install_dir)/.build/util-macros							\
						$(install_dir)/.build/xorgproto								\
						$(install_dir)/.build/xcb-proto								\
						$(install_dir)/.build/libXdmcp								\
						$(install_dir)/.build/libXau								\
						$(install_dir)/.build/libxcb								\
						$(install_dir)/.build/xtrans								\
						$(install_dir)/.build/libX11								\
						$(install_dir)/.build/libXext								\
						$(install_dir)/.build/libFS								\
						$(install_dir)/.build/libICE								\
						$(install_dir)/.build/libSM								\
						$(install_dir)/.build/libXScrnSaver							\
						$(install_dir)/.build/libXt								\
						$(install_dir)/.build/libXmu								\
						$(install_dir)/.build/libXpm								\
						$(install_dir)/.build/libXaw								\
						$(install_dir)/.build/libXfixes								\
						$(install_dir)/.build/libXcomposite							\
						$(install_dir)/.build/libXrender							\
						$(install_dir)/.build/libXcursor							\
						$(install_dir)/.build/libXdamage							\
						$(install_dir)/.build/graphite								\
						$(install_dir)/.build/freetype								\
						$(install_dir)/.build/harfbuzz								\
						$(install_dir)/.build/freetype-pass2							\
						$(install_dir)/.build/fontconfig							\
						$(install_dir)/.build/libfontenc							\
						$(install_dir)/.build/libXfont2								\
						$(install_dir)/.build/libxkbcommon							\
						$(install_dir)/.build/libXft 								\
						$(install_dir)/.build/libXi								\
						$(install_dir)/.build/libXinerama							\
						$(install_dir)/.build/libXrandr								\
						$(install_dir)/.build/libXres								\
						$(install_dir)/.build/libXtst								\
						$(install_dir)/.build/libXv								\
						$(install_dir)/.build/libXvMC								\
						$(install_dir)/.build/libXxf86dga							\
						$(install_dir)/.build/libXxf86vm							\
						$(install_dir)/.build/libpciaccess							\
						$(install_dir)/.build/libxkbfile							\
						$(install_dir)/.build/libxshmfence							\
						$(install_dir)/.build/libXpresent	
	@touch $(install_dir)/.build/x11


#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/.build/utilities:		$(install_dir)/.build/binutils								\
						$(install_dir)/.build/coreutils								\
						$(install_dir)/.build/file								\
						$(install_dir)/.build/gzip								\
						$(install_dir)/.build/diffutils								\
						$(install_dir)/.build/findutils								\
						$(install_dir)/.build/grep								\
						$(install_dir)/.build/tar								\
						$(install_dir)/.build/gawk								\
						$(install_dir)/.build/bash								\
						$(install_dir)/.build/which								\
						$(install_dir)/.build/check								\
						$(install_dir)/.build/curl								\
						$(install_dir)/.build/elfutils								\
						$(install_dir)/.build/attr								\
						$(install_dir)/.build/wget								\
						$(install_dir)/.build/sed								\
						$(install_dir)/.build/patch								\
						$(install_dir)/.build/cpio								\
						$(if $(os_darwin),$(install_dir)/.build/afsctool)
	@touch $(install_dir)/.build/utilities

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/.build/libraries:		$(install_dir)/.build/pcre								\
						$(install_dir)/.build/gmp								\
						$(install_dir)/.build/mpfr								\
						$(install_dir)/.build/mpc								\
						$(install_dir)/.build/isl								\
						$(install_dir)/.build/apr								\
						$(install_dir)/.build/aprutil								\
						$(install_dir)/.build/libatomic_ops							\
						$(install_dir)/.build/clucene								\
						$(install_dir)/.build/libb2								\
						$(install_dir)/.build/libmicrohttpd							\
						$(install_dir)/.build/libunistring							\
						$(install_dir)/.build/libidn2								\
						$(install_dir)/.build/libarchive							\
						$(install_dir)/.build/libevent								\
						$(install_dir)/.build/libdaemon								\
						$(install_dir)/.build/abseil-cpp							\
						$(install_dir)/.build/libxcrypt								\
						$(install_dir)/.build/libpipeline							\
						$(install_dir)/.build/libyaml								\
						$(install_dir)/.build/libunwind								\
						$(install_dir)/.build/libgpgerror							\
						$(install_dir)/.build/libgcrypt								\
						$(install_dir)/.build/libssh2								\
						$(install_dir)/.build/libtasn								\
						$(install_dir)/.build/openmpi								\
						$(install_dir)/.build/boost

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/.build/encryption:		$(install_dir)/.build/openssl								\
						$(install_dir)/.build/nss								\
						$(install_dir)/.build/makeca								\
						$(install_dir)/.build/mbedtls



#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/bin/profile.sh: 			$(script_dir)/bin/epilogue_profile.sh 
	@cat $(script_dir)/bin/epilogue_profile.sh > $(install_dir)/bin/profile.sh

$(install_dir)/bin/epilogue:			$(script_dir)/bin/epilogue 
	@cp $(script_dir)/bin/epilogue $(install_dir)/bin/.

$(install_dir)/RELEASENOTES.md:			$(script_dir)/RELEASENOTES.md 
	@cp $(script_dir)/RELEASENOTES.md $(install_dir)/.

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
epilogue:					$(install_dir)/bin/epilogue

profile:					$(install_dir)/bin/profile.sh

#---------------------------------------------------------------------------------------------------------------------------------------
#
#
$(install_dir)/.build/rust-pkgs:		$(install_dir)/.build/cbindgen								\
						$(install_dir)/.build/bindgen-cli

#---------------------------------------------------------------------------------------------------------------------------------------
#
#		
tools:  																\
#						$(install_dir)/.build/unzip								\
						$(install_dir)/.build/zip								\
						$(install_dir)/.build/flex								\
						$(install_dir)/.build/bison								\
						$(install_dir)/.build/gcc								\
						$(install_dir)/.build/make								\
						$(install_dir)/.build/pkgconf								\
						$(install_dir)/.build/encryption							\
						$(install_dir)/.build/python3								\
							$(install_dir)/.build/python-pkgs						\
							$(install_dir)/.build/meson							\
						$(install_dir)/.build/utilities								\
						$(install_dir)/.build/cmake								\
						$(install_dir)/.build/ninja								\
						$(if $(os_linux), $(install_dir)/.build/tensorflow)					\
						$(install_dir)/.build/tcl								\
							$(if $(os_linux), $(install_dir)/.build/critcl)					\
							$(if $(os_linux), $(install_dir)/.build/cryptlib)				\
							$(if $(os_linux), $(install_dir)/.build/tclmtls-linux) 				\
							$(if $(os_linux), $(install_dir)/.build/tclmtls)				\
							$(install_dir)/.build/nsd							\
						$(install_dir)/.build/openjdk								\
						$(install_dir)/.build/prolog								\
						$(if $(os_linux), $(install_dir)/.build/dpc)						\
						$(install_dir)/.build/rust								\
							$(install_dir)/.build/rust-pkgs							\
						$(install_dir)/.build/otp								\
							$(install_dir)/.build/rebar							\
							$(install_dir)/.build/elixir							\
						$(if $(os_linux), $(install_dir)/.build/xterm)						\
						$(install_dir)/.build/postgresql							\
						$(install_dir)/.build/rdm-14								\
						$(install_dir)/.build/rdm-12								\
						$(install_dir)/.build/rdm-16    							\
						$(install_dir)/.build/rabbitmq								\
						$(install_dir)/.build/sage								\
						$(install_dir)/.build/re2c								\
						$(install_dir)/.build/libraries								\
						$(install_dir)/.build/sparsehash							\
						$(install_dir)/.build/googletest							\
						$(install_dir)/.build/libtool								\
						$(install_dir)/.build/openssh								\
						$(install_dir)/.build/hwloc								\
						$(install_dir)/.build/httpd								\
						$(install_dir)/.build/nasm  								\
						$(install_dir)/.build/perl-xml-parser							\
						$(install_dir)/.build/perl-parse-yapp							\
						$(install_dir)/.build/intltool								\
						$(install_dir)/.build/atk								\
						$(install_dir)/.build/tk								\
						$(install_dir)/.build/pycairo		    						\
						$(install_dir)/.build/acl								\
						$(install_dir)/.build/psmisc								\
						$(install_dir)/.build/procps								\
						$(install_dir)/.build/level-zero							\
						$(install_dir)/.build/leancrypto							\
						$(install_dir)/.build/jansson								\
						$(install_dir)/.build/lmdb								\
						$(install_dir)/.build/python3-p2							\
						$(install_dir)/.build/nodejs								\
						$(if $(os_linux), $(install_dir)/.build/couchdb)					\
						$(install_dir)/.build/scikit-learn							\
						$(install_dir)/.build/scikit-learn-py							\
						$(install_dir)/.build/redis								\
						$(if $(os_linux), $(install_dir)/.build/R)						\
						$(install_dir)/.build/polars								\
						$(if $(os_linux), $(install_dir)/.build/qt5)						\
						$(if $(experimental), $(install_dir)/.build/qt6)					\
						$(if $(os_linux), $(install_dir)/.build/tensorboard)					\
						$(install_dir)/.build/ant								\
						$(install_dir)/.build/clang_format							\
						$(install_dir)/.build/fftw								\
						$(install_dir)/.build/eigen								\
						$(install_dir)/.build/rapidjson								\
						$(install_dir)/.build/arpack-ng								\
						$(install_dir)/.build/pcre3								\
						$(install_dir)/.build/matio								\
						$(install_dir)/.build/ocaml								\
						$(install_dir)/.build/ocaml-num								\
						$(if $(os_linux), $(install_dir)/.build/scala2)						\
						$(if $(os_linux), $(install_dir)/.build/scala3)						\
						$(install_dir)/.build/citus								\
						$(if $(os_linux), $(install_dir)/.build/k-postgresql)					\
						$(if $(os_linux), $(install_dir)/.build/graalvm)					\
						$(install_dir)/.build/airflow								\
						$(install_dir)/.build/awscli								\
						$(if $(os_linux), $(install_dir)/.build/oneDNN)						\
						$(if $(os_linux), $(install_dir)/.build/oneTBB)						\
						$(if $(os_linux), $(install_dir)/.build/oneDAL)						\
						$(if $(os_linux), $(install_dir)/.build/oneDPL)						\
						$(if $(os_linux), $(install_dir)/.build/oneCCL)						\
						$(install_dir)/.build/splunk-sdk							\
						$(install_dir)/.build/maven								\
						$(install_dir)/.build/bdb								\
						$(install_dir)/RELEASENOTES.md								\
						$(install_dir)/.build/fdupes								\
						$(install_dir)/.build/tcl9

						

#---------------------------------------------------------------------------------------------------------------------------------------
# Experimental
#
#						$(install_dir)/.build/samba
#						$(install_dir)/.build/postfix								\
#						$(install_dir)/.build/qemu
#						$(install_dir)/.build/kotlin								\
#						$(install_dir)/.build/scilab								\
						$(install_dir)/.build/julia
#						$(install_dir)/.build/pvm3
#						$(install_dir)/.build/datahub								\
						$(install_dir)/.build/oneMath								\

#---------------------------------------------------------------------------------------------------------------------------------------
# 
#
$(install_dir)/lib/tcl8.6/omnia/%.tcl: 	$(script_dir)/lib/omnia/%.tcl
	@cp -v $< $@

omnia:																	\
#						$(install_dir)/lib/tcl8.6/omnia/console.tcl  						\
						$(install_dir)/lib/tcl8.6/omnia/cryptkit.tcl						\
						$(install_dir)/lib/tcl8.6/omnia/lambda.tcl  						\
						$(install_dir)/lib/tcl8.6/omnia/omnia.tcl       					\
						$(install_dir)/lib/tcl8.6/omnia/omnia_config.tcl  					\
						$(install_dir)/lib/tcl8.6/omnia/omnia_utils.tcl  					\
						$(install_dir)/lib/tcl8.6/omnia/pkgIndex.tcl  						\
						$(install_dir)/lib/tcl8.6/omnia/platform.tcl  						\
						$(install_dir)/lib/tcl8.6/omnia/shell.tcl               


#---------------------------------------------------------------------------------------------------------------------------------------
# 
#
$(install_dir)/lib/tcl8.6/katana/%.tcl: $(script_dir)/lib/katana/%.tcl
	@cp -v $< $@

katana:																	\
#						$(install_dir)/.build/xlsxwriter							\
						$(install_dir)/.build/cryptography							\
						$(install_dir)/.build/pyjwt								\
						$(install_dir)/.build/msal								\
																	\
						$(install_dir)/lib/tcl8.6/katana/appmap.tcl    	                			\
						$(install_dir)/lib/tcl8.6/katana/archer.tcl                                     	\
						$(install_dir)/lib/tcl8.6/katana/backuplogs.tcl                                 	\
						$(install_dir)/lib/tcl8.6/katana/bcic.tcl                                       	\
						$(install_dir)/lib/tcl8.6/katana/beam.tcl                                       	\
						$(install_dir)/lib/tcl8.6/katana/cardservices.tcl                               	\
						$(install_dir)/lib/tcl8.6/katana/cassandra.tcl                                  	\
						$(install_dir)/lib/tcl8.6/katana/console.tcl                                    	\
						$(install_dir)/lib/tcl8.6/katana/db2.tcl                                        	\
						$(install_dir)/lib/tcl8.6/katana/dbbackuplogs.tcl                               	\
						$(install_dir)/lib/tcl8.6/katana/device.tcl                                     	\
						$(install_dir)/lib/tcl8.6/katana/device_cisco.tcl                               	\
						$(install_dir)/lib/tcl8.6/katana/ecert.tcl                                      	\
						$(install_dir)/lib/tcl8.6/katana/erlang.tcl                                     	\
						$(install_dir)/lib/tcl8.6/katana/firewall.tcl                                   	\
						$(install_dir)/lib/tcl8.6/katana/generic_encryption.tcl                         	\
						$(install_dir)/lib/tcl8.6/katana/github.tcl                                     	\
						$(install_dir)/lib/tcl8.6/katana/ipam.tcl                                       	\
						$(install_dir)/lib/tcl8.6/katana/java.tcl                                       	\
						$(install_dir)/lib/tcl8.6/katana/katana.tcl                                     	\
						$(install_dir)/lib/tcl8.6/katana/katana_activity.tcl                            	\
						$(install_dir)/lib/tcl8.6/katana/katana_activity_burndown.tcl                   	\
						$(install_dir)/lib/tcl8.6/katana/katana_activity_ongoing.tcl                    	\
						$(install_dir)/lib/tcl8.6/katana/katana_actor.tcl                               	\
						$(install_dir)/lib/tcl8.6/katana/katana_api.tcl                                 	\
						$(install_dir)/lib/tcl8.6/katana/katana_api_client.tcl                          	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_backup_coverage_report.tcl          	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_browse_records.tcl                  	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_build_user_map.tcl                  	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_check_schema.tcl                    	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_compress.tcl                        	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_config.tcl                          	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_count_records.tcl                   	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_generate_relidx.tcl                 	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_health_check.tcl                    	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_hello_world_example.tcl             	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_integrity_checks.tcl                	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_json_to_dict.tcl                    	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_object_filer.tcl                    	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_perimeter_map.tcl                   	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_replicate_attachments.tcl           	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_reseed_db.tcl                       	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_resolve_networkos.tcl               	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_server.tcl                          	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_servicenow_table_info.tcl           	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_servicenow_table_listing.tcl        	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_sync_service.tcl                    	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_update_schema.tcl                   	\
						$(install_dir)/lib/tcl8.6/katana/katana_app_validate.tcl                        	\
						$(install_dir)/lib/tcl8.6/katana/katana_ccms.tcl                                	\
						$(install_dir)/lib/tcl8.6/katana/katana_cluster.tcl                             	\
						$(install_dir)/lib/tcl8.6/katana/katana_control.tcl                             	\
						$(install_dir)/lib/tcl8.6/katana/katana_core_schema.tcl                         	\
						$(install_dir)/lib/tcl8.6/katana/katana_datadictionary.tcl                      	\
						$(install_dir)/lib/tcl8.6/katana/katana_db_object_type.tcl                    		\
						$(install_dir)/lib/tcl8.6/katana/katana_db_sync.tcl                           		\
						$(install_dir)/lib/tcl8.6/katana/katana_discovery.tcl                         		\
						$(install_dir)/lib/tcl8.6/katana/katana_encryption.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/katana_entitlements.tcl                      		\
						$(install_dir)/lib/tcl8.6/katana/katana_event.tcl                             		\
						$(install_dir)/lib/tcl8.6/katana/katana_exceptions.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/katana_health_check.tcl                      		\
						$(install_dir)/lib/tcl8.6/katana/katana_idom.tcl                              		\
						$(install_dir)/lib/tcl8.6/katana/katana_init.tcl                              		\
						$(install_dir)/lib/tcl8.6/katana/katana_job.tcl                               		\
						$(install_dir)/lib/tcl8.6/katana/katana_logger.tcl                            		\
						$(install_dir)/lib/tcl8.6/katana/katana_metrics.tcl                           		\
						$(install_dir)/lib/tcl8.6/katana/katana_mssqlserver.tcl                       		\
						$(install_dir)/lib/tcl8.6/katana/katana_mysql.tcl                             		\
						$(install_dir)/lib/tcl8.6/katana/katana_nlp.tcl                               		\
						$(install_dir)/lib/tcl8.6/katana/katana_normalization.tcl                     		\
						$(install_dir)/lib/tcl8.6/katana/katana_origin.tcl                            		\
						$(install_dir)/lib/tcl8.6/katana/katana_postgres.tcl                          		\
						$(install_dir)/lib/tcl8.6/katana/katana_proxy.tcl                             		\
						$(install_dir)/lib/tcl8.6/katana/katana_qm.tcl                                		\
						$(install_dir)/lib/tcl8.6/katana/katana_rdm.tcl                               		\
						$(install_dir)/lib/tcl8.6/katana/katana_replication.tcl                       		\
						$(install_dir)/lib/tcl8.6/katana/katana_reports.tcl                           		\
						$(install_dir)/lib/tcl8.6/katana/katana_routing.tcl                           		\
						$(install_dir)/lib/tcl8.6/katana/katana_rules.tcl                             		\
						$(install_dir)/lib/tcl8.6/katana/katana_scheduler.tcl                         		\
						$(install_dir)/lib/tcl8.6/katana/katana_schema.tcl                            		\
						$(install_dir)/lib/tcl8.6/katana/katana_sci.tcl                               		\
						$(install_dir)/lib/tcl8.6/katana/katana_security.tcl                          		\
						$(install_dir)/lib/tcl8.6/katana/katana_sequence.tcl                          		\
						$(install_dir)/lib/tcl8.6/katana/katana_skills.tcl                            		\
						$(install_dir)/lib/tcl8.6/katana/katana_sync.tcl                              		\
						$(install_dir)/lib/tcl8.6/katana/katana_task.tcl                              		\
						$(install_dir)/lib/tcl8.6/katana/katana_tensor.tcl                            		\
						$(install_dir)/lib/tcl8.6/katana/katana_threads.tcl                           		\
						$(install_dir)/lib/tcl8.6/katana/katana_user.tcl                              		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils.tcl                             		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_calendar.tcl                    		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_csv.tcl                         		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_dates.tcl                       		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_encryption.tcl                  		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_excel.tcl                       		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_http.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_index.tcl                       		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_ipc.tcl                         		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_json.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_log_processor.tcl               		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_math.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_raft.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_sql.tcl                         		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_system_data.tcl                 		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_telemtry.tcl                    		\
						$(install_dir)/lib/tcl8.6/katana/katana_utils_time.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/katana_validation.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/katana_validation_rules.tcl                  		\
						$(install_dir)/lib/tcl8.6/katana/katana_vault.tcl                             		\
						$(install_dir)/lib/tcl8.6/katana/katana_vfs.tcl                               		\
						$(install_dir)/lib/tcl8.6/katana/katana_webui.tcl                             		\
						$(install_dir)/lib/tcl8.6/katana/katana_wiki.tcl                              		\
						$(install_dir)/lib/tcl8.6/katana/katana_workflow.tcl                          		\
						$(install_dir)/lib/tcl8.6/katana/katana_worklet.tcl                           		\
						$(install_dir)/lib/tcl8.6/katana/lucene.tcl                                   		\
						$(install_dir)/lib/tcl8.6/katana/mathematica.tcl                              		\
						$(install_dir)/lib/tcl8.6/katana/matlab.tcl                                   		\
						$(install_dir)/lib/tcl8.6/katana/mongodb.tcl                                  		\
						$(install_dir)/lib/tcl8.6/katana/mssql.tcl                                    		\
						$(install_dir)/lib/tcl8.6/katana/msteams.tcl                                  		\
						$(install_dir)/lib/tcl8.6/katana/mysql.tcl                                    		\
						$(install_dir)/lib/tcl8.6/katana/oracle.tcl                                   		\
						$(install_dir)/lib/tcl8.6/katana/perimeter_mapping.tcl                        		\
						$(install_dir)/lib/tcl8.6/katana/pkgIndex.tcl                                 		\
						$(install_dir)/lib/tcl8.6/katana/postgres.tcl                                 		\
						$(install_dir)/lib/tcl8.6/katana/powerbi.tcl                                  		\
						$(install_dir)/lib/tcl8.6/katana/prolog.tcl                                   		\
						$(install_dir)/lib/tcl8.6/katana/python.tcl                                   		\
						$(install_dir)/lib/tcl8.6/katana/raima.tcl                                    		\
						$(install_dir)/lib/tcl8.6/katana/rsam.tcl                                     		\
						$(install_dir)/lib/tcl8.6/katana/satele.tcl                                   		\
						$(install_dir)/lib/tcl8.6/katana/satele_assist.tcl                            		\
						$(install_dir)/lib/tcl8.6/katana/servicenow.tcl                               		\
						$(install_dir)/lib/tcl8.6/katana/shardingsphere.tcl                           		\
						$(install_dir)/lib/tcl8.6/katana/sharepoint.tcl                               		\
						$(install_dir)/lib/tcl8.6/katana/tufin.tcl                                    		\
						$(install_dir)/lib/tcl8.6/katana/unreal.tcl                                   		\
						$(install_dir)/lib/tcl8.6/katana/voltage.tcl                                  		\
						$(install_dir)/lib/tcl8.6/katana/yugabyte.tcl                              

#---------------------------------------------------------------------------------------------------------------------------------------
# 
#
$(install_dir)/apps/%.tcl: $(script_dir)/apps/%.tcl
	@cp -v $< $@

apps:																	\
#						$(install_dir)/apps/cloc.tcl								\
						$(install_dir)/apps/consolidate.tcl     						\
						$(install_dir)/apps/dedup.tcl   							\
						$(install_dir)/apps/dirsize.tcl         						\
						$(install_dir)/apps/dups.tcl    							\
						$(install_dir)/apps/find.tcl    							\
						$(install_dir)/apps/getgithub.tcl       						\
						$(install_dir)/apps/getgithuborgs.tcl   						\
						$(install_dir)/apps/gitlab.tcl  							\
						$(install_dir)/apps/katana.tcl  							\
						$(install_dir)/apps/pagure.tcl  							\
						$(install_dir)/apps/topn.tcl                    	

#---------------------------------------------------------------------------------------------------------------------------------------
# 
#
$(install_dir)/config/%: 			$(script_dir)/config/%
	@cp -v $< $@

config:																	\
#						$(install_dir)/config/katana.cfg							\
						$(install_dir)/config/.secrets

#---------------------------------------------------------------------------------------------------------------------------------------
# Tools build KOS - pronounced Chaos
#
kos:	

all: 	setup profile tools epilogue omnia katana apps config

### AIO Libs
### Julia
### OneAPI
### gitea
### cron
### passwd
### D
### iRAD
### AOL CMS
### OpenHPC	
### OpenML
### LLama 3.3
### PostFix
### Java Libraries & Frameworks
### Clojure
### fuse
### Matlab
### Mathematica
### Cuda
### ROOT Project

#sqlalchemy==2.0.41
