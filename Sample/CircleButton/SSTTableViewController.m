//
//  SSTTableViewController.m
//  CircleButton
//
//  Created by Brennan Stehling on 11/15/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "SSTTableViewController.h"

#import "SSTCircleButton.h"

@interface SSTTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SSTTableViewController

#pragma mark - User Actions
#pragma mark -

- (IBAction)circleButtonTapped:(SSTCircleButton *)button {
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    button.borderHidden = !button.borderHidden;
}

#pragma mark - UITableViewDataSource
#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row % 2) {
        static NSString *CellIdentifier = @"EvenCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    }
    else {
        static NSString *CellIdentifier = @"OddCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
#pragma mark -

@end
