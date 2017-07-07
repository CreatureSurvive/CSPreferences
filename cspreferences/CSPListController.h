/**
 * @Author: Dana Buehre <creaturesurvive>
 * @Date:   01-07-2017 10:49:52
 * @Email:  dbuehre@me.com
 * @Project: motuumLS
 * @Filename: CSPListController.h
 * @Last modified by:   creaturesurvive
 * @Last modified time: 07-07-2017 2:28:31
 * @Copyright: Copyright © 2014-2017 CreatureSurvive
 */

#import <UIKit/UIKit.h>
#include <spawn.h>
#include "CSPCommon.h"

@interface CSPListController : PSListController <UITableViewDelegate>
- (id)initWithPlistName:(NSString *)plist;
@end
