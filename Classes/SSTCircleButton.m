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

CGFloat const SSTCircleButtonBorderAnimationDuration = 0.25f;

#pragma mark - Class Extension
#pragma mark -

@interface SSTCircleButton ()

@property (strong, nonatomic) UIColor *borderColor;

@end

@implementation SSTCircleButton

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _borderAnimationDuration = SSTCircleButtonBorderAnimationDuration;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cornerRadius = CGRectGetWidth(self.frame) / 2;
    
    if (self.layer.cornerRadius != cornerRadius) {
        if (![[UIColor clearColor] isEqual:self.superview.backgroundColor]) {
            self.borderColor = self.superview.backgroundColor;
        }
        
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
    [self setBorderHidden:borderHidden animated:FALSE];
}

- (void)setBorderHidden:(BOOL)borderHidden animated:(BOOL)animated {
    if (_borderHidden == borderHidden) {
        return;
    }
    
    _borderHidden = borderHidden;
    
    UIColor *fromColor = borderHidden ? self.borderColor : [UIColor clearColor];
    UIColor *toColor = borderHidden ? [UIColor clearColor] : self.borderColor;
    
    if (animated) {
        CABasicAnimation *color = [CABasicAnimation animationWithKeyPath:@"borderColor"];
        color.fromValue = (id)fromColor.CGColor;
        color.toValue   = (id)toColor.CGColor;
        color.duration = _borderAnimationDuration;
        color.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.superview.layer addAnimation:color forKey:@"color"];
    }
    
    self.superview.layer.borderColor = toColor.CGColor;
}

@end
