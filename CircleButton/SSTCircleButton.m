//
//  SSTCircleButton.m
//  CircleButton
//
//  Created by Brennan Stehling on 11/12/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "SSTCircleButton.h"

#import <QuartzCore/QuartzCore.h>

#import "SSTCircleWrapperView.h"

@implementation SSTCircleButton

- (void)drawRect:(CGRect)rect {
    // round view and superview with a border using the background color of the superview
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
    self.layer.masksToBounds = YES;
    
    if ([self.superview isKindOfClass:[SSTCircleWrapperView class]]) {
        self.superview.layer.cornerRadius = CGRectGetWidth(self.superview.frame) / 2;
        self.superview.layer.masksToBounds = YES;
        self.superview.layer.borderColor = self.superview.backgroundColor.CGColor;
        self.superview.layer.borderWidth = (CGRectGetWidth(self.superview.frame) - CGRectGetWidth(self.frame)) / 2;
    }
}

@end
