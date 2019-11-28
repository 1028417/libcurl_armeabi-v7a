
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS) 
LOCAL_MODULE := libcrypto
LOCAL_SRC_FILES := ../openssl-1.1.0f/armeabi-v7a/lib/libcrypto.so
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS) 
LOCAL_MODULE := libssl
LOCAL_SRC_FILES := ../openssl-1.1.0f/armeabi-v7a/lib/libssl.so
include $(PREBUILT_SHARED_LIBRARY)


TARGET_ARCH_ABI := armeabi-v7a
TARGET_ABI      := android-9-armeabi

common_CFLAGS := -Wpointer-arith -Wwrite-strings -Wunused -Winline \
				-Wnested-externs -Wmissing-declarations -Wmissing-prototypes \
				-Wno-long-long -Wfloat-equal -Wno-multichar -Wsign-compare \
				-Wno-format-nonliteral -Wendif-labels -Wstrict-prototypes \
				-Wdeclaration-after-statement -Wno-system-headers \
				-DBUILDING_LIBCURL -DHAVE_CONFIG_H \
				-DHAVE_OPENSSL -DUSE_OPENSSL #-DUSE_ARES #-DUSE_IPV6
				
#########################
# Build the libcurl library

include $(CLEAR_VARS)
include $(LOCAL_PATH)/lib/Makefile.inc

LOCAL_CFLAGS += $(common_CFLAGS)

#CURL_HEADERS := \
#	curlbuild.h \
#	curl.h \
#	curlrules.h \
#	curlver.h \
#	easy.h \
#	mprintf.h \
#	multi.h \
#	stdcheaders.h \
#	typecheck-gcc.h

LOCAL_SRC_FILES := $(addprefix lib/,$(CSOURCES))
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/lib/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../openssl-1.1.0f/include

#c-ares code
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../c-ares/

LOCAL_SRC_FILES += \
	../c-ares/ares__close_sockets.c \
	../c-ares/ares__get_hostent.c \
	../c-ares/ares__read_line.c \
	../c-ares/ares__timeval.c \
	../c-ares/ares_cancel.c \
	../c-ares/ares_create_query.c \
	../c-ares/ares_data.c \
	../c-ares/ares_destroy.c \
	../c-ares/ares_expand_name.c \
	../c-ares/ares_free_hostent.c \
	../c-ares/ares_free_string.c \
	../c-ares/ares_gethostbyname.c \
	../c-ares/ares_getsock.c \
	../c-ares/ares_init.c \
	../c-ares/ares_library_init.c\
	../c-ares/ares_llist.c \
	../c-ares/ares_nowarn.c \
	../c-ares/ares_options.c \
	../c-ares/ares_parse_a_reply.c \
	../c-ares/ares_parse_aaaa_reply.c \
	../c-ares/ares_process.c \
	../c-ares/ares_query.c \
	../c-ares/ares_search.c \
	../c-ares/ares_send.c \
	../c-ares/ares_strerror.c \
	../c-ares/ares_timeout.c \
	../c-ares/ares_version.c \
	../c-ares/bitncmp.c \
	../c-ares/inet_net_pton.c \
	../c-ares/ares_strdup.c \
	../c-ares/ares_getnameinfo.c \
	../c-ares/ares_gethostbyaddr.c \
	../c-ares/_inet_ntop.c \
	../c-ares/ares_parse_ptr_reply.c \
	../c-ares/ares_android.c \
	../c-ares/ares_strsplit.c

LOCAL_MODULE:= libcurl
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := libcrypto libssl

#LOCAL_LDFLAGS := -L$(LOCAL_PATH)/../openssl-1.1.0f/armeabi-v7a/lib  -lcrypto  -lssl

# Copy the licence to a place where Android will find it.
# Actually, this doesn't quite work because the build system searches
# for NOTICE files before it gets to this point, so it will only be seen
# on subsequent builds. 
 
include $(BUILD_SHARED_LIBRARY)

