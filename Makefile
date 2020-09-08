TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
DEBUG = 0
FINALPACKAGE = 1


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JiggleMode

JiggleMode_FILES = Tweak.xm
JiggleMode_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += jigglemodeprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
