//
//  CustomLabel.h
//  TigerMechineDemo
//
//  Created by jctmac on 17/2/17.
//  Copyright © 2017年 jctmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLabel : UILabel
/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
