//
//  NavigationBar.m
//  aClock
//
//  Created by AppVV on 10/13/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "NavBar.h"
#import "PrettyKit.h"

@implementation NavBar

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        [self initVars];
    }
    return self;
}

//重新定制NavigationBar,重新画颜色
- (void)initVars
{
    self.contentMode = UIViewContentModeRedraw;
    self.topLineColor = [UIColor colorWithHex:0xFF8020];
    self.gradientStartColor = [UIColor colorWithHex:0xFF8020];
    self.gradientEndColor = [UIColor colorWithHex:0xFF8020];
    self.bottomLineColor = [UIColor colorWithHex:0xFF8020];
    self.tintColor = self.gradientEndColor;
    self.roundedCornerRadius = 3.0;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
