//
//  LocatViewController.m
//  aClock
//
//  Created by AppVV on 10/12/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "LocatViewController.h"

@interface LocatViewController ()

@end

@implementation LocatViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor blueColor];
        self.tabBarItem.title = @"位置";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_partition_h"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
