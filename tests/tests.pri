TEMPLATE = app

QT += testlib
CONFIG   += c++11 console testcase
CONFIG   -= app_bundle

LIBS += -L$$OUT_PWD/../../src -lQObjectListModel
INCLUDEPATH += $$PWD/../src
