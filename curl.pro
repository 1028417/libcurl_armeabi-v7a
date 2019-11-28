QT -= gui

TEMPLATE = lib

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

DEFINES += BUILDING_LIBCURL  USE_OPENSSL  HAVE_OPENSSL \
            CARES_BUILDING_LIBRARY  #USE_ARES
            #USE_IPV6

win32: {
    LIBS += -lws2_32 -lwldap32

    LIBS += $$PWD/openssl-1.1.0h/lib/libcrypto.lib \
            $$PWD/openssl-1.1.0h/lib/libssl.lib

    DESTDIR = $$PWD/bin
} else {
    DEFINES += HAVE_CONFIG_H

    LIBS += -lcrypto -lssl

android {
    LIBS += -L$$PWD/openssl-1.1.0f/armeabi-v7a/lib

    INCLUDEPATH += ./jni/lib/curl_config_android

    DESTDIR = $$PWD/libs/armeabi-v7a
} else {
    LIBS += -L$$PWD/libs/mac

    INCLUDEPATH += ./jni/lib/curl_config_mac

    DESTDIR = $$PWD/bin/mac
}
}

TARGET = xcurl

INCLUDEPATH += ./jni/include  ./jni/lib  ./openssl-1.1.0h/include  ./c-ares

SOURCES += \
    jni/lib/altsvc.c \
    jni/lib/amigaos.c \
    jni/lib/asyn-ares.c \
    jni/lib/asyn-thread.c \
    jni/lib/base64.c \
    jni/lib/conncache.c \
    jni/lib/connect.c \
    jni/lib/content_encoding.c \
    jni/lib/cookie.c \
    jni/lib/curl_addrinfo.c \
    jni/lib/curl_ctype.c \
    jni/lib/curl_des.c \
    jni/lib/curl_endian.c \
    jni/lib/curl_fnmatch.c \
    jni/lib/curl_get_line.c \
    jni/lib/curl_gethostname.c \
    jni/lib/curl_gssapi.c \
    jni/lib/curl_memrchr.c \
    jni/lib/curl_multibyte.c \
    jni/lib/curl_ntlm_core.c \
    jni/lib/curl_ntlm_wb.c \
    jni/lib/curl_path.c \
    jni/lib/curl_range.c \
    jni/lib/curl_rtmp.c \
    jni/lib/curl_sasl.c \
    jni/lib/curl_sspi.c \
    jni/lib/curl_threads.c \
    jni/lib/dict.c \
    jni/lib/doh.c \
    jni/lib/dotdot.c \
    jni/lib/easy.c \
    jni/lib/escape.c \
    jni/lib/file.c \
    jni/lib/fileinfo.c \
    jni/lib/formdata.c \
    jni/lib/ftp.c \
    jni/lib/ftplistparser.c \
    jni/lib/getenv.c \
    jni/lib/getinfo.c \
    jni/lib/gopher.c \
    jni/lib/hash.c \
    jni/lib/hmac.c \
    jni/lib/hostasyn.c \
    jni/lib/hostcheck.c \
    jni/lib/hostip.c \
    jni/lib/hostip4.c \
    jni/lib/hostip6.c \
    jni/lib/hostsyn.c \
    jni/lib/http.c \
    jni/lib/http2.c \
    jni/lib/http_chunks.c \
    jni/lib/http_digest.c \
    jni/lib/http_negotiate.c \
    jni/lib/http_ntlm.c \
    jni/lib/http_proxy.c \
    jni/lib/idn_win32.c \
    jni/lib/if2ip.c \
    jni/lib/imap.c \
    jni/lib/inet_ntop.c \
    jni/lib/inet_pton.c \
    jni/lib/krb5.c \
    jni/lib/ldap.c \
    jni/lib/llist.c \
    jni/lib/md4.c \
    jni/lib/md5.c \
    jni/lib/memdebug.c \
    jni/lib/mime.c \
    jni/lib/mprintf.c \
    jni/lib/multi.c \
    jni/lib/netrc.c \
    jni/lib/non-ascii.c \
    jni/lib/nonblock.c \
    jni/lib/nwlib.c \
    jni/lib/nwos.c \
    jni/lib/openldap.c \
    jni/lib/parsedate.c \
    jni/lib/pingpong.c \
    jni/lib/pop3.c \
    jni/lib/progress.c \
    jni/lib/psl.c \
    jni/lib/rand.c \
    jni/lib/rtsp.c \
    jni/lib/security.c \
    jni/lib/select.c \
    jni/lib/sendf.c \
    jni/lib/setopt.c \
    jni/lib/sha256.c \
    jni/lib/share.c \
    jni/lib/slist.c \
    jni/lib/smb.c \
    jni/lib/smtp.c \
    jni/lib/socketpair.c \
    jni/lib/socks.c \
    jni/lib/socks_gssapi.c \
    jni/lib/socks_sspi.c \
    jni/lib/speedcheck.c \
    jni/lib/splay.c \
    jni/lib/strcase.c \
    jni/lib/strdup.c \
    jni/lib/strerror.c \
    jni/lib/strtok.c \
    jni/lib/strtoofft.c \
    jni/lib/system_win32.c \
    jni/lib/telnet.c \
    jni/lib/tftp.c \
    jni/lib/timeval.c \
    jni/lib/transfer.c \
    jni/lib/url.c \
    jni/lib/urlapi.c \
    jni/lib/vauth/cleartext.c \
    jni/lib/vauth/cram.c \
    jni/lib/vauth/digest.c \
    jni/lib/vauth/digest_sspi.c \
    jni/lib/vauth/krb5_gssapi.c \
    jni/lib/vauth/krb5_sspi.c \
    jni/lib/vauth/ntlm.c \
    jni/lib/vauth/ntlm_sspi.c \
    jni/lib/vauth/oauth2.c \
    jni/lib/vauth/spnego_gssapi.c \
    jni/lib/vauth/spnego_sspi.c \
    jni/lib/vauth/vauth.c \
    jni/lib/version.c \
    jni/lib/vtls/gskit.c \
    jni/lib/vtls/gtls.c \
    jni/lib/vtls/mbedtls.c \
    jni/lib/vtls/mesalink.c \
    jni/lib/vtls/nss.c \
    jni/lib/vtls/openssl.c \
    jni/lib/vtls/polarssl.c \
    jni/lib/vtls/polarssl_threadlock.c \
    jni/lib/vtls/schannel.c \
    jni/lib/vtls/schannel_verify.c \
    jni/lib/vtls/sectransp.c \
    jni/lib/vtls/vtls.c \
    jni/lib/vtls/wolfssl.c \
    jni/lib/warnless.c \
    jni/lib/wildcard.c \
    jni/lib/x509asn1.c

macx {} else: ios {} else {
SOURCES += \
    c-ares/ares__close_sockets.c \
    c-ares/ares__get_hostent.c \
    c-ares/ares__read_line.c \
    c-ares/ares__timeval.c \
    c-ares/ares_cancel.c \
    c-ares/ares_create_query.c \
    c-ares/ares_data.c \
    c-ares/ares_destroy.c \
    c-ares/ares_expand_name.c \
    c-ares/ares_free_hostent.c \
    c-ares/ares_free_string.c \
    c-ares/ares_gethostbyname.c \
    c-ares/ares_getsock.c \
    c-ares/ares_init.c \
    c-ares/ares_library_init.c\
    c-ares/ares_llist.c \
    c-ares/ares_nowarn.c \
    c-ares/ares_options.c \
    c-ares/ares_parse_a_reply.c \
    c-ares/ares_parse_aaaa_reply.c \
    c-ares/ares_process.c \
    c-ares/ares_query.c \
    c-ares/ares_search.c \
    c-ares/ares_send.c \
    c-ares/ares_strerror.c \
    c-ares/ares_timeout.c \
    c-ares/ares_version.c \
    c-ares/bitncmp.c \
    c-ares/inet_net_pton.c \
    c-ares/ares_strdup.c \
    c-ares/ares_getnameinfo.c \
    c-ares/ares_gethostbyaddr.c \
    c-ares/_inet_ntop.c \
    c-ares/ares_parse_ptr_reply.c \
    c-ares/ares_android.c \
    c-ares/ares_strsplit.c \
# just for win32???
    c-ares/ares_expand_string.c \
    c-ares/ares_fds.c \
    c-ares/ares_getenv.c \
    c-ares/ares_getopt.c \
    c-ares/ares_mkquery.c \
    c-ares/ares_parse_mx_reply.c \
    c-ares/ares_parse_naptr_reply.c \
    c-ares/ares_parse_ns_reply.c \
    c-ares/ares_parse_soa_reply.c \
    c-ares/ares_parse_srv_reply.c \
    c-ares/ares_parse_txt_reply.c \
    c-ares/ares_platform.c \
    c-ares/ares_strcasecmp.c \
    c-ares/ares_writev.c \
    c-ares/windows_port.c
}
