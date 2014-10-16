//
//  SSTViewController.m
//  CircleButton
//
//  Created by Brennan Stehling on 11/12/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "SSTViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "SSTCircleButton.h"

@interface SSTViewController ()

@end

@implementation SSTViewController

#pragma mark - User Actions
#pragma mark -

- (IBAction)circleButtonTapped:(SSTCircleButton *)button {
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    button.borderHidden = !button.borderHidden;
}

@end
