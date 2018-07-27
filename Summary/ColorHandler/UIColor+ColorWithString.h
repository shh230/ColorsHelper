//
//  UIColor+ColorWithString.h
//  ColorsHelper
//
//  Created by Si on 2018/6/11.
//  Copyright © 2018年 Si. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorWithString)


/**
 通过输入十六进制字符串，生成UIColor对象

 @param color 输入的十六进制字符串
 @return 生成的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
