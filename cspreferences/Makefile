include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CSPreferences
CSPreferences_FILES = CSPListController.m
CSPreferences_INSTALL_PATH = /Library/PreferenceBundles
CSPreferences_FRAMEWORKS = UIKit
CSPreferences_PRIVATE_FRAMEWORKS = Preferences
CSPreferences_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CSPreferences.plist$(ECHO_END)
