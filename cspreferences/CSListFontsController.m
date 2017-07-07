/**
 * @Author: Dana Buehre <creaturesurvive>
 * @Date:   07-07-2017 12:32:06
 * @Email:  dbuehre@me.com
 * @Project: motuumLS
 * @Filename: CSListFontsController.m
 * @Last modified by:   creaturesurvive
 * @Last modified time: 07-07-2017 1:32:14
 * @Copyright: Copyright © 2014-2017 CreatureSurvive
 */


#include "CSPCommon.h"

@interface PSListItemsController : PSListController
@end

@interface CSListFontsController : PSListItemsController
@end

@implementation CSListFontsController


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
    // [cell.textLabel setAdjustsFontSizeToFitWidth:YES]; 
    cell.textLabel.textColor = _accentTintColor;
    cell.textLabel.font = [UIFont fontWithName:cell.textLabel.text size:20];
    return cell;
}

@end
