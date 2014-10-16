//
//  SSTCircleButton.h
//  CircleButton
//
//  Created by Brennan Stehling on 11/12/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat const SSTCircleButtonBorderAnimationDuration;

@interface SSTCircleButton : UIButton

@property (assign, nonatomic, getter=isBorderHidden) BOOL borderHidden;
@property (assign, nonatomic) CGFloat borderAnimationDuration; // default = 0.25f

- (void)setBorderHidden:(BOOL)borderHidden animated:(BOOL)animated;

@end
