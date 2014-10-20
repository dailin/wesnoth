#parameter Device accept two value: OS or Simulator
LOCAL_PATH :=  .
APP_SUBDIRS := libs/iostreams/src
LOCAL_CPP_EXTENSION := .c
PREFIX = /Developer/Platforms/iPhoneOS.platform/Developer
target :=  gobject.a
SDKVER = 5.0
SDK = $(PREFIX)/SDKs/iPhoneOS$(SDKVER).sdk

CC := $(PREFIX)/usr/bin/llvm-gcc-4.2
LD := $(CC)
LIBTOOL :=$(PREFIX)/usr/bin/libtool
AR := $(PREFIX)/usr/bin/ar
RANLIB :=  $(PREFIX)/usr/bin/ranlib
##INCLUDE PATH For apple
INCPATH += -I"$(SDK)/usr/include"
INCPATH += -I"$(PREFIX)/usr/lib/gcc/arm-apple-darwin10/4.2.1/include"
INCPATH += -I"$(PREFIX)/usr/include"
INCPATH += -I"."
INCPATH += -I".."
INCPATH += -I"../glib"
INCPATH += -I"../android"

#Build Switch
CFLAGS  += $(INCPATH) \
	-arch armv7 \
	-DHAVE_CONFIG_H			\
	-DG_LOG_DOMAIN=\"GLib-GObject\"	\
	-DGOBJECT_COMPILATION		\
	-DG_DISABLE_CONST_RETURNS	\
	-DG_DISABLE_DEPRECATED  \
	$(NULL)

#sources := $(foreach F, $(APP_SUBDIRS), $(addprefix $(F)/,$(notdir $(wildcard $(LOCAL_PATH)/$(F)/*$(LOCAL_CPP_EXTENSION)))))

sources:= \
	gatomicarray.c			\
	gbinding.c			\
	gboxed.c			\
	gclosure.c			\
	genums.c			\
	gobject.c			\
	gparam.c			\
	gparamspecs.c			\
	gsignal.c			\
	gsourceclosure.c		\
	gtype.c				\
	gtypemodule.c			\
	gtypeplugin.c			\
	gvalue.c			\
	gvaluearray.c			\
	gvaluetransform.c		\
	gvaluetypes.c \
	$(NULL)

modules :=  $(sources:$(LOCAL_CPP_EXTENSION)=.o)

all: $(target)

$(target): $(modules)
	$(AR) rvc $@ $?
	$(RANLIB) $@

%o : %cpp
	$(CC) $(CFLAGS) -c -o $@ $<
%o : %c
	$(CC) $(CFLAGS) -c -o $@ $<
# *.d files are treated as makefiles. This is a rule saying how to update them.

cleanall: clean cleandepends

clean:
	-rm -f $(modules)
	-rm -f $(target)


cleandepends:
	-rm -f $(depends)

