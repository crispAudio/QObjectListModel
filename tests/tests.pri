TEMPLATE = app

QT += testlib
QT -= gui
CONFIG += c++11 console testcase
CONFIG -= app_bundle

LIBS += -L$$OUT_PWD/../../src -lQObjectListModel
INCLUDEPATH += $$PWD/../src
