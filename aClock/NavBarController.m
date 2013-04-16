//
//  NavBarController.m
//  aClock
//
//  Created by AppVV on 10/13/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "NavBarController.h"
#import "NavBar.h"


@interface NavBarController ()

@end

@implementation NavBarController


- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self setValue:[[[NavBar alloc] init] autorelease] forKey:@"navigationBar"];
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
