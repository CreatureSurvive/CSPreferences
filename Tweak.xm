/**
 * @Author: Dana Buehre <creaturesurvive>
 * @Date:   01-07-2017 8:48:49
 * @Email:  dbuehre@me.com
 * @Project: motuumLS
 * @Filename: Tweak.xm
 * @Last modified by:   creaturesurvive
 * @Last modified time: 01-07-2017 4:26:05
 * @Copyright: Copyright © 2014-2017 CreatureSurvive
 */


#define _plistfile (@"/User/Library/Preferences/com.creaturecoding.cspreferencesdemo.plist")
#define _prefsChanged "com.creaturecoding.cspreferencesdemo.prefschanged"

// Variables
static BOOL enabled = NO;
static BOOL setting1 = NO;
static int setting2 = 0;
static int setting3 = 0;


// Functions
static void LoadSettings(){
    NSMutableDictionary *preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:_plistfile];

    if (preferences == nil) {
        enabled = NO;
    } else {
        enabled = preferences[@"enabled"] ? [preferences[@"enabled"] boolValue] : NO;
        setting1 = preferences[@"setting1"] ? [preferences[@"setting1"] boolValue] : NO;
        setting2 = preferences[@"setting2"] ? [preferences[@"setting2"] intValue] : 0;
        setting3 = preferences[@"setting3"] ? [preferences[@"setting3"] intValue] : 0;
    }

    // [preferences release];
    HBLogInfo(@"enabled : %@ | setting1 : %@ | setting2 : %@ | setting3 : %@", @(enabled).stringValue, @(setting1).stringValue, @(setting2).stringValue, @(setting3).stringValue);
}

static void TweakReceivedNotification(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo){
    NSString *notificationName = (__bridge NSString *)name;
    if ([notificationName isEqualToString:[NSString stringWithUTF8String:_prefsChanged]]) {
        LoadSettings();
    }
}

// Hooks
%group Group_SpringBoard
// %hook Something
// %end // hook Something
%end // Group_SpringBoard

// Initialize
%ctor
{
    @autoreleasepool {
        LoadSettings();
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                        NULL,
                                        TweakReceivedNotification,
                                        CFSTR(_prefsChanged),
                                        NULL,
                                        CFNotificationSuspensionBehaviorCoalesce
                                        );

        %init(Group_SpringBoard);
    }
}
