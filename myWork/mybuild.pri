message("BREAKPAD_crash_handler_attached")

##必需的一些配置
# qBreakpad中需要使用到network模块
QT += network
# 启用多线程、异常、RTTI、STL支持
CONFIG += thread exceptions rtti stl
#realease模式下也可以生成pdb文件
QMAKE_CXXFLAGS_RELEASE = $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO 
QMAKE_LFLAGS_RELEASE = $$QMAKE_LFLAGS_RELEASE_WITH_DEBUGINFO
# without c++11 & AppKit library compiler can't solve address for symbols
CONFIG += c++11
macx: LIBS += -framework AppKit
#指示编译器生成更多或更少警告，可以不设置
# CONFIG += warn_on #warn_off 
##

##链接头文件
INCLUDEPATH += $$PWD/../handler/
HEADERS += \
    $$PWD/../handler/QBreakpadHandler.h \
    $$PWD/../handler/QBreakpadHttpUploader.h

##链接库文件
#---将编译类型存储于一个变量中，所有库都可使用该变量，避免后续的CONFIG(debug, debug|release)代码---
buildType =
CONFIG(debug, debug|release):{
    buildType = debug
}else{
    buildType = release
}
message("buildType is set to $$buildType")
#----------------------

#---qt库版本，库版本与编译器与qt版本有关，编译器一般只用MSVC与GCC的64位版本
qtLib_compiler_name =
equals(QT_MAJOR_VERSION, 5) { #qt5
    win32:qtLib_compiler_name = MSVC2019_64_QT_5_15
    unix:qtLib_compiler_name = GCC_64_QT_5_15
}
equals(QT_MAJOR_VERSION, 6) { #qt6
    win32:qtLib_compiler_name = MSVC2019_64_QT_6_5
    unix:qtLib_compiler_name = GCC_64_QT_6_5
}
message("qtLib_compiler_name is set to $$qtLib_compiler_name")
#----------------------

message("qbreakpad_compiler_name is set to $$qtLib_compiler_name")
##
LIBS += -L$$PWD/lib/$$qtLib_compiler_name/$$buildType -lqBreakpad