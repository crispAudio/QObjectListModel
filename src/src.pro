include(../coverage.pri)

QT  += qml

TARGET = QObjectListModel

TEMPLATE = lib
CONFIG += c++11

DEFINES += QOBJECTLISTMODEL_LIBRARY

SOURCES += qobjectlistmodel.cpp

HEADERS += qobjectlistmodel.h\
    qobjectlistmodelt.h\
    qobjectlistmodel_global.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
