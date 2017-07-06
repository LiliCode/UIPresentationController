//
//  ViewController.m
//  UIPresentationController
//
//  Created by LiliEhuu on 17/7/4.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "ViewController.h"
#import "AlertViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"image6.jpg"];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:imageView];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    AlertViewController *alert = [[AlertViewController alloc] init];
    
    alert.cornerRadius = 10;
    alert.edgeInsets = UIEdgeInsetsMake(0, 10, 10, 10);
    
    AlertPresentationController *presentationController = [[AlertPresentationController alloc] initWithPresentedViewController:alert presentingViewController:self];
    alert.transitioningDelegate = presentationController;
    
    [self presentViewController:alert animated:YES completion:nil];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
