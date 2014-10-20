LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := sdl_gfx

LOCAL_CFLAGS := -I$(LOCAL_PATH) -I$(LOCAL_PATH)/.. \
                -I$(LOCAL_PATH)/../sdl-$(SDL_VERSION)/include -I$(LOCAL_PATH)/include

LOCAL_CPP_EXTENSION := .cpp

# Note this simple makefile var substitution, you can find even simpler examples in different Android projects
LOCAL_SRC_FILES := $(notdir $(wildcard $(LOCAL_PATH)/*.c))

LOCAL_SHARED_LIBRARIES := sdl-$(SDL_VERSION)

ifeq (,$(findstring $(LOCAL_MODULE), $(APP_AVAILABLE_STATIC_LIBS)))
include $(BUILD_SHARED_LIBRARY)
else
include $(BUILD_STATIC_LIBRARY)
endif

