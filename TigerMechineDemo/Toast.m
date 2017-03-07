//
//  Toast.m
//  5UFARM
//
//  Created by wanghy on 16/3/16.
//  Copyright © 2016年 macmini1. All rights reserved.
//

#import "Toast.h"

@implementation Toast
#define SystemFontSize(font) [UIFont systemFontOfSize:font]

+ (void)makeText:(UIView*)inView
         Message:(NSString*)message
   afterHideTime:(float)hideTime
{
    MBProgressHUD *progressHud = [[MBProgressHUD alloc] initWithView:inView];
    progressHud.layer.zPosition = 15.0f;
    progressHud.detailsLabelText = message;
    progressHud.color = [UIColor darkGrayColor];
    progressHud.center = inView.center;
    progressHud.labelFont = SystemFontSize(18);
    progressHud.alpha = 0.5f;
    progressHud.mode = MBProgressHUDModeText;
    [inView addSubview:progressHud];
    [progressHud showAnimated:YES
          whileExecutingBlock:^{
              sleep(hideTime);
          }
              completionBlock:^{
                  [progressHud removeFromSuperview];
              }];
}

@end
