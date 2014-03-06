//
//  SSTCircleImageView.m
//  CircleButton
//
//  Created by Brennan Stehling on 11/15/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "SSTCircleImageView.h"

#import <QuartzCore/QuartzCore.h>

#import "SSTCircleWrapperView.h"

@implementation SSTCircleImageView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cornerRadius = CGRectGetWidth(self.frame) / 2;
    
    if (self.layer.cornerRadius != cornerRadius) {
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
        
        if ([self.superview isKindOfClass:[SSTCircleWrapperView class]]) {
            self.superview.layer.cornerRadius = CGRectGetWidth(self.superview.frame) / 2;
            self.superview.layer.masksToBounds = YES;
            self.superview.layer.borderColor = self.superview.backgroundColor.CGColor;
            self.superview.layer.borderWidth = (CGRectGetWidth(self.superview.frame) - CGRectGetWidth(self.frame)) / 2;
        }
    }
}

@end
