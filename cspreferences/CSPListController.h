/**
 * @Author: Dana Buehre <creaturesurvive>
 * @Date:   01-07-2017 10:49:52
 * @Email:  dbuehre@me.com
 * @Project: motuumLS
 * @Filename: CSPListController.h
 * @Last modified by:   creaturesurvive
 * @Last modified time: 01-07-2017 6:03:05
 * @Copyright: Copyright © 2014-2017 CreatureSurvive
 */

#import <UIKit/UIKit.h>
#include <spawn.h>
#include "CSPCommon.h"

@interface CSPListController : PSListController <UITableViewDelegate>{
    NSMutableDictionary *_settings;
    UIColor *_prefsTintColor;
}
@end
