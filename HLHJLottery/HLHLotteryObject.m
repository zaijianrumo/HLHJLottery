//
//  HLHLotteryObject.m
//  YouYiMeiDemo
//
//  Created by book on 2018/11/14.
//  Copyright © 2018年 book. All rights reserved.
//

#import "HLHLotteryObject.h"
#import <SetI001/SetI001LoginViewController.h>
@implementation HLHLotteryObject

-(void)goLogin{
    
    SetI001LoginViewController *login  = [[SetI001LoginViewController alloc]init];
    login.hidesBottomBarWhenPushed = YES;
    [[self getCurrentVC].navigationController pushViewController:login animated:YES];

    
}
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;

    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }

    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];

    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;

    return result;
}
@end
