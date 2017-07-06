//
//  UIViewController+Transition.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/28.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "UIViewController+Transition.h"
#import <objc/runtime.h>

static char *kPushTransitionAnimation = "kPushTransitionAnimation";
static char *kPopTransitionAnimation = "kPopTransitionAnimation";
static char *kPresentTransitionAnimation = "kPresentTransitionAnimation";
static char *kDismissTransitionAnimation = "kDismissTransitionAnimation";
static char *kPresentationController = "kPresentationController";


@implementation UIViewController (Transition)

#pragma mark - 运行时添加属性

- (void)setPushAnimationController:(AnimationController *)pushAnimationController
{
    pushAnimationController.taType = TransitionAnimationTypeShow;   //动画显示
    objc_setAssociatedObject(self, &kPushTransitionAnimation, pushAnimationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AnimationController *)pushAnimationController
{
    return objc_getAssociatedObject(self, &kPushTransitionAnimation);
}

- (void)setPopAnimationController:(AnimationController *)popAnimationController
{
    popAnimationController.taType = TransitionAnimationTypeHide;   //动画消失
    objc_setAssociatedObject(self, &kPopTransitionAnimation, popAnimationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AnimationController *)popAnimationController
{
    return objc_getAssociatedObject(self, &kPopTransitionAnimation);
}

- (void)setPresentAnimationController:(AnimationController *)presentAnimationController
{
    presentAnimationController.taType = TransitionAnimationTypeShow;
    objc_setAssociatedObject(self, &kPresentTransitionAnimation, presentAnimationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AnimationController *)presentAnimationController
{
    return objc_getAssociatedObject(self, &kPresentTransitionAnimation);
}

- (void)setDismissAnimationController:(AnimationController *)dismissAnimationController
{
    dismissAnimationController.taType = TransitionAnimationTypeHide;
    objc_setAssociatedObject(self, &kDismissTransitionAnimation, dismissAnimationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AnimationController *)dismissAnimationController
{
    return objc_getAssociatedObject(self, &kDismissTransitionAnimation);
}

- (void)setPresentationController:(UIPresentationController *)presentationController
{
    objc_setAssociatedObject(self, &kPresentationController, presentationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPresentationController *)presentationController
{
    return objc_getAssociatedObject(self, &kPresentationController);
}


#pragma mark - UINavigationControllerDelegate, UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        return self.pushAnimationController;    //如果是push 过去
    }
    else if (operation == UINavigationControllerOperationPop)
    {
        return self.popAnimationController;     //如果是pop 回去
    }
    
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimationController;     // 模态 Present方式
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimationController;     //模态 Dismiss方式
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return self.presentationController;
}

@end




