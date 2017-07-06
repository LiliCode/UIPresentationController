//
//  TransitionAnimation.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/28.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "AnimationController.h"

@interface AnimationController ()


@end

@implementation AnimationController

+ (instancetype)transition
{
    return [[self alloc] init];
}

+ (instancetype)transitionWithType:(TransitionAnimationType)taType
{
    AnimationController *controller = [[self alloc] init];
    controller.taType = taType;
    return controller;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.taType)
    {
        case TransitionAnimationTypeShow:
            if ([self respondsToSelector:@selector(showTransitionAnimation:)])
            {
                [self showTransitionAnimation:transitionContext];
            }
            break;
            
        case TransitionAnimationTypeHide:
            if ([self respondsToSelector:@selector(hideTransitionAnimation:)])
            {
                [self hideTransitionAnimation:transitionContext];
            }
            break;
            
        default: break;
    }
}




@end
