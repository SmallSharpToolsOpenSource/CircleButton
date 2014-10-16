//
//  SSTCollectionViewController.m
//  CircleButton
//
//  Created by Brennan Stehling on 11/15/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "SSTCollectionViewController.h"

#import "SSTCircleButton.h"

@interface SSTCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SSTCollectionViewController

#pragma mark - User Actions
#pragma mark -

- (IBAction)circleButtonTapped:(SSTCircleButton *)button {
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    button.borderHidden = !button.borderHidden;
}

#pragma mark - UICollectionViewDataSource
#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    if (indexPath.item % 2) {
        static NSString *EvenCellIdentifier = @"EvenCell";
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:EvenCellIdentifier forIndexPath:indexPath];

    }
    else {
        static NSString *OddCellIdentifier = @"OddCell";
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:OddCellIdentifier forIndexPath:indexPath];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
#pragma mark -

@end
