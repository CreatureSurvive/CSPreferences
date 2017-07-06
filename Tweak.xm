/**
 * @Author: Dana Buehre <creaturesurvive>
 * @Date:   01-07-2017 8:48:49
 * @Email:  dbuehre@me.com
 * @Project: motuumLS
 * @Filename: Tweak.xm
 * @Last modified by:   creaturesurvive
 * @Last modified time: 06-07-2017 3:15:38
 * @Copyright: Copyright © 2014-2017 CreatureSurvive
 */
 #import <UserNotifications/UNUserNotifications.h>
 #import <substrate.h>

@interface Preferences : UIApplication
@end

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
%hook Preferences
%new
- (void)userNotificationCenter: (UNUserNotificationCenter *)center willPresentNotification: (UNNotification *)notification withCompletionHandler: (void (^)(long long options))completionHandler {
    // Ensure that alerts will display in-app.
    completionHandler(2);
}

%end
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
