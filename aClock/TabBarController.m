//
//  TabBarController.m
//  aClock
//
//  Created by AppVV on 10/16/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "TabBarController.h"
#import "RecommViewController.h"
#import "UCenterViewController.h"
#import "LocatViewController.h"
#import "SearchViewController.h"
#import "MoreViewController.h"
#import "NavBarController.h"
#import "PrettyDrawing.h"
#import "sys/utsname.h"

@interface TabBarController ()

@property (nonatomic, retain) NSArray *tabTitleLabels;

@end

@implementation TabBarController
@synthesize tabTitleLabels;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        //通过不同的系统版本运行不同的代码
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
            NSLog(@"Device system version is iOS5+");
            [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
        }else{
            NSLog(@"Device system version is less than iOS5");
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_background"]];
            imageView.frame = CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
            imageView.contentMode = UIViewContentModeScaleToFill;
            [[self tabBar] insertSubview:imageView atIndex:0];
            [imageView release];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initTabBarViewControllers];
}

//用于设置tabBarItem中 title的颜色
#pragma mark - recolorTabBarTitleLabels
- (NSArray *)tabTitleLabels
{
    // Check if we need to update the tab labels
    if ([tabTitleLabels count] != [self.viewControllers count])
        self.tabTitleLabels = nil;
    
    // Create custom tab bar title labels
    if (!tabTitleLabels)
    {
        tabTitleLabels = [[NSMutableArray alloc] init];
        
        for (UIView *view in self.tabBar.subviews)
        {
            if ([NSStringFromClass([view class]) isEqualToString:@"UITabBarButton"])
            {
                for (UIView *subview in view.subviews)
                {
                    if ([subview isKindOfClass:[UILabel class]])
                    {
                        UILabel *label = (UILabel *)subview;
                        
                        UILabel *newLabel = [[UILabel alloc] init];
                        newLabel.font = label.font;
                        newLabel.text = label.text;
                        newLabel.backgroundColor = label.backgroundColor;
                        newLabel.opaque = YES;
                        newLabel.frame = CGRectMake(0, 0, label.frame.size.width, label.frame.size.height);
                        [subview addSubview:newLabel];
                        
                        [((NSMutableArray *)tabTitleLabels) addObject:newLabel];
                        [newLabel release];
                    }
                }
            }
        }
    }
    
    return tabTitleLabels;
}

// Customize the desired colors here
- (void)recolorTabBarTitleLabels
{
    for (UILabel *label in self.tabTitleLabels)
    {
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
    }
    //iOS4里面执行下面的代码会出错
//    UILabel *selectedLabel = [self.tabTitleLabels objectAtIndex:self.selectedIndex];
//    selectedLabel.textColor = [UIColor blueColor];
//    selectedLabel.backgroundColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self recolorTabBarTitleLabels];
}

- (void)tabBarController:(UITabBarController *)theTabBarController didSelectViewController:(UIViewController *)viewController
{
    [self recolorTabBarTitleLabels];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.tabTitleLabels = nil;
}

- (void)dealloc
{
    [tabTitleLabels release];
    [super dealloc];
}

//用于处理tabBar的选中高亮的图片,不显示
#pragma mark - setNoHighlightTabBar
- (void)setNoHighlightTabBar
{
    int tabCount = [self.viewControllers count] > 5 ? 5 : [self.viewControllers count];
    NSArray * tabBarSubviews = [self.tabBar subviews];
    for(int i = [tabBarSubviews count] - 1; i > [tabBarSubviews count] - tabCount - 1; i--)
    {
        for(UIView *view in [[tabBarSubviews objectAtIndex:i] subviews])
        {
            if(view && [NSStringFromClass([view class]) isEqualToString:@"UITabBarSelectionIndicatorView"])
            {//the v is the highlight view.
                [view removeFromSuperview];
                break;
            }
        }
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    [self setNoHighlightTabBar];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController
{
    [super setSelectedViewController:selectedViewController];
    [self setNoHighlightTabBar];
}

- (void)initTabBarViewControllers
{
    RecommViewController *recomm = [[[RecommViewController alloc] init] autorelease];
    UCenterViewController *ucenter = [[[UCenterViewController alloc] init] autorelease];
    LocatViewController *locat = [[[LocatViewController alloc] init] autorelease];
    SearchViewController *search = [[[SearchViewController alloc] init] autorelease];
    MoreViewController *more = [[[MoreViewController alloc] init] autorelease];
    
    NavBarController *recommNav = [[[NavBarController alloc] initWithRootViewController:recomm] autorelease];
    NavBarController *ucenterNav = [[[NavBarController alloc] initWithRootViewController:ucenter] autorelease];
    NavBarController *locatNav = [[[NavBarController alloc] initWithRootViewController:locat] autorelease];
    NavBarController *searchNav = [[[NavBarController alloc] initWithRootViewController:search] autorelease];
    NavBarController *moreNav = [[[NavBarController alloc] initWithRootViewController:more] autorelease];
    self.viewControllers = [NSArray arrayWithObjects:recommNav, ucenterNav, locatNav, searchNav, moreNav, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
