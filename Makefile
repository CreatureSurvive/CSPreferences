# @Author: Dana Buehre <creaturesurvive>
# @Date:   01-07-2017 8:48:49
# @Email:  dbuehre@me.com
# @Project: motuumLS
# @Filename: Makefile
# @Last modified by:   creaturesurvive
# @Last modified time: 05-07-2017 5:59:56
# @Copyright: Copyright © 2014-2017 CreatureSurvive


ARCHS = armv7 armv7s arm64
GO_EASY_ON_ME=1
TARGET = iphone:clang:10.1:latest
THEOS_DEVICE_IP = 192.168.86.200
THEOS_DEVICE_PORT=22

FINALPACKAGE = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CSPreferencesDemo
# CSPreferencesDemo_FILES = Tweak.xm
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete

after-install::
	install.exec "killall -9 Preferences"

SUBPROJECTS += cspreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
