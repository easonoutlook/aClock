//
//  TabBarItem.m
//  aClock
//
//  Created by AppVV on 10/16/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem
@synthesize hightlightImage;

- (UIImage *)selectImage
{
    return self.hightlightImage;
}

- (void)dealloc
{
    [hightlightImage release];
    hightlightImage = nil;
    [super dealloc];
}

@end
