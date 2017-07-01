/**
 * @Author: Dana Buehre <creaturesurvive>
 * @Date:   01-07-2017 10:49:52
 * @Email:  dbuehre@me.com
 * @Project: motuumLS
 * @Filename: CSPListController.h
 * @Last modified by:   creaturesurvive
 * @Last modified time: 01-07-2017 3:55:23
 * @Copyright: Copyright © 2014-2017 CreatureSurvive
 */


#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSControlTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <SafariServices/SafariServices.h>
#include <spawn.h>

#define _plistfile (@"/User/Library/Preferences/com.creaturesurvive.fastdel.plist")
#define _prefsChanged (@"com.creaturesurvive.fastdel.prefschanged")
#define _bundleID (@"com.creaturesurvive.fastdel")

#define _accentTintColor [UIColor colorWithRed:0.2905 green:0.5632 blue:0.8872 alpha:1.0000]
#define _titleString (@"CSPreferences")
#define _subString (@"by: CreatureSurvive")

@interface CSPListController : PSListController <UITableViewDelegate>{
    NSMutableDictionary *_settings;
    UIColor *_prefsTintColor;
}
@end
