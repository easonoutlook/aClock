//
//  UCenterViewController.m
//  aClock
//
//  Created by AppVV on 10/12/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "UCenterViewController.h"
#import "UINavigationBar+BackgroundImage.h"

@interface UCenterViewController ()

@end

@implementation UCenterViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        
        self.view.backgroundColor = [UIColor greenColor];
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_collect_h"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)customNavBackButton
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5.0, 10.0, 37.0, 22.0);
    [backButton setImage:[UIImage imageNamed:@"navbar_backbutton"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"navbar_backbutton"] forState:UIControlStateSelected];
    [backButton addTarget:self action:@selector(navBackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
    self.tabBarController.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    [temporaryBarButtonItem release];
}

- (void)navBackButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 设置导航栏背景颜色
//    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_background"] forBarMetrics:UIBarMetricsDefault];
//    }else{
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_background"]];
//    }
    [self customNavBackButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
