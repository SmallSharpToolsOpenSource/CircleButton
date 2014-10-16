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

#pragma mark - Class Extension
#pragma mark -

@interface SSTCircleButton ()

@property (strong, nonatomic) UIColor *borderColor;

@end

@implementation SSTCircleButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cornerRadius = CGRectGetWidth(self.frame) / 2;
    
    if (self.layer.cornerRadius != cornerRadius) {
        self.borderColor = self.superview.backgroundColor;
        
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
        
        if ([self.superview isKindOfClass:[SSTCircleWrapperView class]]) {
            self.superview.layer.cornerRadius = CGRectGetWidth(self.superview.frame) / 2;
            self.superview.layer.masksToBounds = YES;
            
            self.superview.layer.borderColor = self.borderColor.CGColor;
            self.superview.layer.borderWidth = (CGRectGetWidth(self.superview.frame) - CGRectGetWidth(self.frame)) / 2;
            self.superview.backgroundColor = [UIColor clearColor];
        }
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

- (void)setBorderHidden:(BOOL)borderHidden {
    _borderHidden = borderHidden;
    
    if (borderHidden) {
        self.superview.layer.borderColor = [[UIColor clearColor] CGColor];
        self.superview.layer.borderWidth = 0.0;
    }
    else {
        self.superview.layer.borderColor = self.borderColor.CGColor;
        self.superview.layer.borderWidth = (CGRectGetWidth(self.superview.frame) - CGRectGetWidth(self.frame)) / 2;
    }
}

@end
