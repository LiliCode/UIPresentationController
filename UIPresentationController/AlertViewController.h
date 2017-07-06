//
//  AlertViewController.h
//  UIPresentationController
//
//  Created by LiliEhuu on 17/7/5.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertPresentationController.h"

@interface AlertViewController : UIViewController
//alertView
@property (strong , nonatomic) UIView *alertView;
//内边距
@property (assign , nonatomic) UIEdgeInsets edgeInsets;
//圆角
@property (assign , nonatomic) CGFloat cornerRadius;



@end
