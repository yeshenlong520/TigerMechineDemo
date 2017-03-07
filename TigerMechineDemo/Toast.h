//
//  Toast.h
//  5UFARM
//
//  Created by wanghy on 16/3/16.
//  Copyright © 2016年 macmini1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
@interface Toast : NSObject

+ (void)makeText:(UIView*)inView
         Message:(NSString*)message
   afterHideTime:(float)hideTime;

@end
