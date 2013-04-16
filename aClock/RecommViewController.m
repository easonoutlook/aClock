//
//  RecommViewController.m
//  aClock
//
//  Created by AppVV on 10/12/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "RecommViewController.h"
#import "PrettyKit.h"
#import "TabBarController.h"
#import "UCenterViewController.h"
#import "PushTestViewController.h"
#import "TabBarItem.h"

@interface RecommViewController ()

@end

@implementation RecommViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor redColor];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_recommend_h"];
        
//        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"推荐" image:[UIImage imageNamed:@"tabbar_recommend_h"] tag:100];
//        self.tabBarItem = tabItem;
//        [tabItem release];
//        [self customNavBackButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self customNavBar];
    
    //测试代码区域,放置一个push的button
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pushButton.frame = CGRectMake(100, 100, 120, 50);
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:pushButton];
    
}

- (void)pushViewController
{
    TabBarController *newTab = [[TabBarController alloc] init];

    PushTestViewController *push = [[[PushTestViewController alloc] init] autorelease];
    push.tabBarItem.title = @"push";
    UCenterViewController *ucenter = [[[UCenterViewController alloc] init] autorelease];
    ucenter.tabBarItem.title = @"ucenter";
    
    newTab.viewControllers = [NSArray arrayWithObjects:ucenter,push, nil];
    newTab.hidesBottomBarWhenPushed = YES;
    newTab.navigationItem.hidesBackButton = YES;
    ucenter.hidesBottomBarWhenPushed = YES;
//    ucenter.navigationItem.hidesBackButton = YES;
    newTab.navigationItem.title = @"YEs";
    [self.navigationController pushViewController:newTab animated:YES];
}

- (void)customNavBar
{
    PrettyNavigationBar *navBar = (PrettyNavigationBar *)self.navigationController.navigationBar;
    navBar.topLineColor = [UIColor colorWithHex:0xFF1000];
    navBar.gradientStartColor = [UIColor colorWithHex:0xDD0000];
    navBar.gradientEndColor = [UIColor colorWithHex:0xAA0000];
    navBar.bottomLineColor = [UIColor colorWithHex:0x990000];
    navBar.tintColor = navBar.gradientEndColor;
    navBar.roundedCornerRadius = 6;
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
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    [temporaryBarButtonItem release];
}

- (void)navBackButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
