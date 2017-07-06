//
//  UIViewController+Transition.h
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/28.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationController.h"


@interface UIViewController (Transition)<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (strong , nonatomic) AnimationController *pushAnimationController;
@property (strong , nonatomic) AnimationController *popAnimationController;
@property (strong , nonatomic) AnimationController *presentAnimationController;
@property (strong , nonatomic) AnimationController *dismissAnimationController;
@property (strong , nonatomic) UIPresentationController *presentationController;



@end
