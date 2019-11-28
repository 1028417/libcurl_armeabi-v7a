
curl-7.67，集成c-ares1.15.0(异步DNS解析)
win32版本集成openssl-1.1.0h（https协议支持），安卓版本集成openssl-1.1.0f


Qt编译：
Qt5打开curl.pro项目，可编译mingw、android、mac、ios版本动态库
mingw、android版本取消屏蔽USE_ARES宏定义可支持DNS异步解析。


NDK编译：
执行以下命令生成armeabi-v7a动态库：
cd /d d:\libcurl_openssl_c-ares--build\jni

d:\android-ndk-r15c\ndk-build.cmd

修改jni/Application.mk可生成其他eabi版本的动态库。
打开Android.mk中的USE_ARES宏定义可支持动态域名异步解析。


VC编译：
VS2017打开curl-all.sln解决方案，选择“dll openssl”配置编译。
取消屏蔽USE_ARES宏定义可支持DNS异步解析。
