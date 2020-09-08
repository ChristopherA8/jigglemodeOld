TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = jigglemodeprefs

jigglemodeprefs_FILES = THXRootListController.m
jigglemodeprefs_FRAMEWORKS = UIKit
jigglemodeprefs_PRIVATE_FRAMEWORKS = Preferences
jigglemodeprefs_INSTALL_PATH = /Library/PreferenceBundles
jigglemodeprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
