//
//  TransitionAnimation.h
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/28.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//
//  AnimationController
//  过渡动画控制器基类
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 过渡动画类型

 - TransitionAnimationTypeShow: 控制器显示的过渡动画
 - TransitionAnimationTypeHide: 控制器消失的过渡动画
 */
typedef NS_ENUM(NSUInteger, TransitionAnimationType)
{
    TransitionAnimationTypeShow,
    TransitionAnimationTypeHide
};


/**
 过渡动画执行代理，子类重写
 */
@protocol AnimatedTransitioning <NSObject>

@optional

/**
 控制器出现的过渡动画

 @param transitionContext 过渡动画的上下文
 */
- (void)showTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 控制器消失的过渡动画
 
 @param transitionContext 过渡动画的上下文
 */
- (void)hideTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

@end


@interface AnimationController : NSObject<UIViewControllerAnimatedTransitioning, AnimatedTransitioning>

@property (assign , nonatomic) TransitionAnimationType taType;  //过渡动画类型

/**
 初始化一个过渡动画控制器类

 @return 返回当前实例对象
 */
+ (instancetype)transition;

/**
 初始化一个过渡动画控制器类

 @param taType 控制器类型
 @return 返回控制器实例对象
 */
+ (instancetype)transitionWithType:(TransitionAnimationType)taType;

@end
