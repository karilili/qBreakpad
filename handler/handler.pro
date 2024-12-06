TEMPLATE = lib
TARGET = qBreakpad
#Application version
#VERSION = 0.4.0

CONFIG += warn_on thread exceptions rtti stl
QT -= gui
QT += core network

OBJECTS_DIR = _build/obj
MOC_DIR = _build
DESTDIR = $$PWD

QMAKE_CXXFLAGS_RELEASE = $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO #realease模式下也可以生成pdb文件
QMAKE_LFLAGS_RELEASE = $$QMAKE_LFLAGS_RELEASE_WITH_DEBUGINFO

### qBreakpad config
include($$PWD/../config.pri)

## google-breakpad
include($$PWD/../third_party/breakpad.pri)

HEADERS += \
    $$PWD/singletone/call_once.h \
    $$PWD/singletone/singleton.h \
    $$PWD/QBreakpadHandler.h \
    $$PWD/QBreakpadHttpUploader.h

SOURCES += \
    $$PWD/QBreakpadHandler.cpp \
    $$PWD/QBreakpadHttpUploader.cpp
