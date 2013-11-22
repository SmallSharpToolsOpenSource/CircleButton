//
//  SSTCircleButton.m
//  CircleButton
//
//  Created by Brennan Stehling on 11/12/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "SSTCircleButton.h"

#import <QuartzCore/QuartzCore.h>

@implementation SSTCircleButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cornerRadius = CGRectGetWidth(self.frame) / 2;
    
    if (self.layer.cornerRadius != cornerRadius) {
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
        
        self.superview.layer.cornerRadius = CGRectGetWidth(self.superview.frame) / 2;
        self.superview.layer.masksToBounds = YES;
        self.superview.layer.borderColor = self.superview.backgroundColor.CGColor;
        self.superview.layer.borderWidth = (CGRectGetWidth(self.superview.frame) - CGRectGetWidth(self.frame)) / 2;
    }
}

- (CGRect)backgroundRectForBounds:(CGRect)bounds {
    UIImage *backgroundImage = [self backgroundImageForState:self.state];
    if (backgroundImage) {
        CGFloat maxWidth = CGRectGetWidth(self.frame);
        
        CGFloat xDelta = maxWidth / backgroundImage.size.width;
        CGFloat yDelta = maxWidth / backgroundImage.size.height;
        CGFloat delta = xDelta > yDelta ? xDelta : yDelta;
        
        CGFloat x = floorf((self.bounds.size.width - (backgroundImage.size.width * delta)) / 2);
        CGFloat y = floorf((self.bounds.size.height - (backgroundImage.size.height * delta)) / 2);
        
        return CGRectMake(x, y, backgroundImage.size.width * delta, backgroundImage.size.height * delta);
    }
    else {
        return [super backgroundRectForBounds:bounds];
    }
}

@end
