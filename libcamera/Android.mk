LOCAL_PATH := $(call my-dir)

#ifneq ($(filter $(SAMSUNG_TARGETS),$(TARGET_DEVICE)),)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_SRC_FILES := QualcommCameraHardware.cpp
LOCAL_CFLAGS := -DDLOPEN_LIBMMCAMERA=1

# Can be raised to 6 to improve framerate, at the cost of allocating
# more ADSP memory. Use 0xa68000 as pool size in kernel to test
LOCAL_CFLAGS += -DNUM_PREVIEW_BUFFERS=2 -D_ANDROID_

LOCAL_C_INCLUDES += \
    $(TARGET_OUT_HEADERS)/mm-camera \
    $(TARGET_OUT_HEADERS)/mm-still/jpeg

LOCAL_SHARED_LIBRARIES := libutils libui libcamera_client liblog libcutils libbinder libdl

LOCAL_MODULE := libcamera
include $(BUILD_SHARED_LIBRARY)

# Make camera wrapper

include $(CLEAR_VARS)

LOCAL_C_FLAGS        += -O3
LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE         := camera.$(TARGET_DEVICE)
LOCAL_SRC_FILES      := cameraHal.cpp
LOCAL_PRELINK_MODULE := false

LOCAL_SHARED_LIBRARIES := liblog libdl libutils libcamera_client libbinder libcutils libhardware libcamera libui

LOCAL_C_INCLUDES       := frameworks/base/services \
                          frameworks/base/include \
                          hardware/libhardware/include \
                          hardware

include $(BUILD_SHARED_LIBRARY)

#endif
