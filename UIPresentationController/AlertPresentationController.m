//
//  AlertPresentationController.m
//  UIPresentationController
//
//  Created by LiliEhuu on 17/7/5.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "AlertPresentationController.h"
#import "AlertAnimationController.h"

@interface AlertPresentationController ()
@property (strong , nonatomic) UIVisualEffectView *dimmingView; //遮罩视图-模糊效果    version >= iOS9.0
@property (strong , nonatomic) UIView *dimmingBackView;         //遮罩视图-半透明效果   version < iOS9.0


@end

@implementation AlertPresentationController


- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    return [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
}


- (void)presentationTransitionWillBegin
{
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
    {
        self.dimmingView = [[UIVisualEffectView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.containerView addSubview:self.dimmingView];
    }
    else
    {
        self.dimmingBackView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.containerView addSubview:self.dimmingBackView];
        self.dimmingBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.0f];
    }
    
    //转场协调器: 通过使用「负责呈现」的 controller 的 UIViewControllerTransitionCoordinator，我们可以确保我们的动画与其他动画一道儿播放。
    id <UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
            [self.dimmingView setEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        else
            self.dimmingBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5f];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    if (!completed)
    {
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
            [self.dimmingView removeFromSuperview];
        else
            [self.dimmingBackView removeFromSuperview];
    }
}


- (void)dismissalTransitionWillBegin
{
    //转场协调器: 通过使用「负责呈现」的 controller 的 UIViewControllerTransitionCoordinator，我们可以确保我们的动画与其他动画一道儿播放。
    id <UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
            [self.dimmingView setEffect:nil];
        else
            self.dimmingBackView.alpha = 0.0f;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed)
    {
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
            [self.dimmingView removeFromSuperview];
        else
            [self.dimmingBackView removeFromSuperview];
    }
}


#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [AlertAnimationController transitionWithType:TransitionAnimationTypeShow];     // 模态 Present方式
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [AlertAnimationController transitionWithType:TransitionAnimationTypeHide];     //模态 Dismiss方式
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return self;
}




@end
