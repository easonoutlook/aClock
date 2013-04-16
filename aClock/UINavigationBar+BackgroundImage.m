//
//  UINavigationBar+BackgroundImage.m
//  aClock
//
//  Created by AppVV on 10/17/12.
//  Copyright (c) 2012 appvv. All rights reserved.
//

#import "UINavigationBar+BackgroundImage.h"

@implementation UINavigationBar (BackgroundImage)
UIImageView *backgroundView;
-(void)setBackgroundImage:(UIImage*)image
{
    self.tintColor = [UIColor brownColor];
    
    if (image == nil) {
        [backgroundView removeFromSuperview];
    }else{
        if (backgroundView != nil) {
            //这里remove是解决tab页来回切换，navagationItem.left和right按钮被背景图片遮挡
            [backgroundView removeFromSuperview];
        }
        
        backgroundView = [[UIImageView alloc] initWithImage:image];
        backgroundView.tag = 10;
        backgroundView.frame = CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height);
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:backgroundView];
        [self sendSubviewToBack:backgroundView];
        [backgroundView release];
    }
}

//for other views
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    [super insertSubview:view atIndex:index];
    [self sendSubviewToBack:backgroundView];
}

@end
