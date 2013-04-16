//
//  TabBar.m
//  aClock
//
//  Created by AppVV on 10/16/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "TabBar.h"
#import "PrettyDrawing.h"


#define default_gradient_start_color [UIColor colorWithHex:0x888888]
#define default_gradient_end_color [UIColor colorWithHex:0x888888]
#define default_separator_line_color [UIColor colorWithHex:0xFF0000]

@implementation TabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initVars];
    }
    return self;
}

- (void)initVars
{
    self.contentMode = UIViewContentModeRedraw;
    
    self.gradientStartColor = default_gradient_start_color;
    self.gradientEndColor = default_gradient_end_color;
    self.separatorLineColor = default_separator_line_color;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initVars];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self initVars];
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [PrettyDrawing drawGradient:rect fromColor:self.gradientStartColor toColor:self.gradientEndColor];
    [PrettyDrawing drawLineAtHeight:0.5 rect:rect color:self.separatorLineColor width:2.5];
}

- (void)dealloc
{
    self.gradientStartColor = nil;
    self.gradientEndColor = nil;
    self.separatorLineColor = nil;
    
    [super dealloc];
}

@end
