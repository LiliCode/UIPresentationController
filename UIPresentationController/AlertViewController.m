//
//  AlertViewController.m
//  UIPresentationController
//
//  Created by LiliEhuu on 17/7/5.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "AlertViewController.h"
#import "UIViewController+Transition.h"
#import "AlertAnimationController.h"
#import "AlertPresentationController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor yellowColor];
    
//    self.transitioningDelegate = self;
//    self.presentTransitionAnimation = [[AlertAnimationController alloc] init];
//    self.dismissTransitionAnimation = [[AlertAnimationController alloc] init];

    
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat alertH = 250.0f;
    CGRect rect = CGRectMake(self.edgeInsets.left, size.height - alertH, size.width - self.edgeInsets.left - self.edgeInsets.right, alertH);
    self.alertView = [[UIView alloc] initWithFrame:rect];
    self.alertView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.alertView];
    
    if (self.cornerRadius)
    {
        self.alertView.layer.cornerRadius = self.cornerRadius;
    }
    
    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:self.alertView.bounds];
    picker.contentMode = UIDatePickerModeDate;
    [self.alertView addSubview:picker];
    picker.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //得到触摸点在self.view上面的位置
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    //得到alertView 在self.view上面的rect
    CGRect rect = [self.view convertRect:self.alertView.frame toView:self.view];
    //判断
    if (!CGRectContainsPoint(rect, touchPoint))
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end



