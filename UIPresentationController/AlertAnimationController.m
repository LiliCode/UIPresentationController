//
//  AlertAnimationController.m
//  UIPresentationController
//
//  Created by LiliEhuu on 17/7/5.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "AlertAnimationController.h"

@implementation AlertAnimationController


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .4f;
}

- (void)showTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIView *alertView = [toViewController valueForKey:@"_alertView"];
    UIEdgeInsets insets = [[toViewController valueForKey:@"_edgeInsets"] UIEdgeInsetsValue];
    CGPoint center = alertView.center;
    center.y = size.height + alertView.bounds.size.height + insets.bottom;
    alertView.center = center;
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGPoint center = alertView.center;
        center.y = size.height - alertView.bounds.size.height / 2.0f - insets.bottom;
        alertView.center = center;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)hideTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIView *alertView = [fromViewController valueForKey:@"_alertView"];
    
    [[transitionContext containerView] addSubview:alertView];
    
    [UIView animateWithDuration:.3 animations:^{
        CGPoint center = alertView.center;
        center.y = size.height + alertView.bounds.size.height;
        alertView.center = center;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


@end



