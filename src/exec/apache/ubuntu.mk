##
##  Makefile -- Build procedure for sample konoha Apache module
##  Autogenerated via ``apxs -n konoha -g''.
##

builddir=.
top_srcdir=/usr/share/apache2
top_builddir=/usr/share/apache2
include /usr/share/apache2/build/special.mk

#   the used tools
APXS=apxs
APACHECTL=apachectl

#   additional defines, includes and libraries
#DEFS=-Dmy_define=my_value
DEFS=-DK_INTERNAL=1 -DHAVE_CONFIG_H
#INCLUDES=-Imy/include/dir
INCLUDES=-I../../../include -I../../../build
#LIBS=-Lmy/lib/dir -lmylib
CFLAGS=-g0 -O2 -W -Wall
LDFLAGS=-L../../../build -lkonoha

#   the default target
all: local-shared-build

#   install the shared object file into Apache~
install: install-modules-yes

#   cleanup
clean:
	-rm -f mod_konoha.o mod_konoha.lo mod_konoha.slo mod_konoha.la~

#   simple test
test: reload
	lynx -mime_header http://localhost/konoha

#   install and activate shared object by reloading Apache to
#   force a reload of the shared object file
reload: install restart

#   the general Apache start/restart/stop
#   procedures
start:
	$(APACHECTL) start
restart:
	$(APACHECTL) restart
stop:
	$(APACHECTL) stop

