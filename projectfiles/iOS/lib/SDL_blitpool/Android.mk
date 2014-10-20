LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := sdl_blitpool

LOCAL_CFLAGS := \
	-I$(LOCAL_PATH) \
	-I$(LOCAL_PATH)/../sdl-$(SDL_VERSION)/include \
	-I$(LOCAL_PATH)/include

LOCAL_CPP_EXTENSION := .cpp

LOCAL_SRC_FILES := SDL_blitpool.c

LOCAL_SHARED_LIBRARIES := sdl-$(SDL_VERSION)
LOCAL_STATIC_LIBRARIES :=
LOCAL_LDLIBS :=

ifeq (,$(findstring $(LOCAL_MODULE), $(APP_AVAILABLE_STATIC_LIBS)))
include $(BUILD_SHARED_LIBRARY)
else
include $(BUILD_STATIC_LIBRARY)
endif

