/**
 * @Author: Dana Buehre <creaturesurvive>
 * @Date:   01-07-2017 5:43:54
 * @Email:  dbuehre@me.com
 * @Project: motuumLS
 * @Filename: CSListItemsController.m
 * @Last modified by:   creaturesurvive
 * @Last modified time: 01-07-2017 5:53:17
 * @Copyright: Copyright © 2014-2017 CreatureSurvive
 */


#include "CSPCommon.h"

@interface PSListItemsController : PSListController
@end

@interface CSListItemsController : PSListItemsController
@end

@implementation CSListItemsController

// set the tint colors before the view appears
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setTint];
}

// sets the tint colors for the view
- (void)setTint {
    // Color the navbar
    self.navigationController.navigationController.navigationBar.tintColor = _accentTintColor;
    self.navigationController.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : _accentTintColor};

    // set tableView tint color
    [UITableView appearanceWhenContainedInInstancesOfClasses:@[[self.class class]]].tintColor = _accentTintColor;

    // set the view tint
    self.view.tintColor = _accentTintColor;
}

// Adjust labels when loading the cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    [cell.textLabel setAdjustsFontSizeToFitWidth:YES];
    [cell.detailTextLabel setAdjustsFontSizeToFitWidth:YES];
    cell.textLabel.textColor = _accentTintColor;
    return cell;
}

@end
