include( coverage.pri )

TEMPLATE = subdirs

SUBDIRS = src\
    tests\

tests.depends = src
