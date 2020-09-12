TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
#DEBUG = 0
#FINALPACKAGE = 1


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JiggleMode

$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += jigglemodeprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
