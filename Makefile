TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JiggleMode

JiggleMode_FILES = Tweak.x
JiggleMode_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += jigglemodeprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
