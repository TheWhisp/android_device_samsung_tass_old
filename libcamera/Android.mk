LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_SRC_FILES := QualcommCameraHardware.cpp
LOCAL_CFLAGS := -DDLOPEN_LIBMMCAMERA=1

LOCAL_CFLAGS += -DNUM_PREVIEW_BUFFERS=2 -D_ANDROID_

LOCAL_C_INCLUDES += \
    $(TARGET_OUT_HEADERS)/mm-camera \
    $(TARGET_OUT_HEADERS)/mm-still/jpeg

LOCAL_SHARED_LIBRARIES := libutils libui libcamera_client liblog libcutils libbinder libdl

LOCAL_MODULE := libcamera
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_C_FLAGS        += -O3
LOCAL_SRC_FILES      := cameraHal.cpp
LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE         := camera.$(TARGET_DEVICE)

LOCAL_PRELINK_MODULE := false

LOCAL_SHARED_LIBRARIES := liblog libdl libutils libcamera_client libbinder libcutils libhardware libcamera libui
LOCAL_C_INCLUDES       := frameworks/av/include frameworks/base/include frameworks/native/include
LOCAL_C_INCLUDES       += hardware/libhardware/include/ hardware

include $(BUILD_SHARED_LIBRARY)
