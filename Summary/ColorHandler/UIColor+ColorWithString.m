//
//  UIColor+ColorWithString.m
//  ColorsHelper
//
//  Created by Si on 2018/6/11.
//  Copyright © 2018年 Si. All rights reserved.
//

#import "UIColor+ColorWithString.h"

@implementation UIColor (ColorWithString)

/**
 通过输入十六进制字符串，生成UIColor对象
 
 @param color 输入的十六进制字符串
 @return 生成的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color{
    unsigned rgbValue = [self handleColor:color];
    
    return [[self class] colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:((rgbValue & 0xFF)) A:1.0];
}

/**
 通过输入十六进制字符串，生成UIColor对象
 
 @param color 输入的十六进制字符串
 @param alpha 透明程度
 @return 生成的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    unsigned rgbValue = [self handleColor:color];

    return [[self class] colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:((rgbValue & 0xFF)) A:alpha];
}

#pragma mark - Private

#pragma mark - RGBA Helper method
+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

/**
 处理十六进制字符串

 @return 返回十进制的字符串
 */
+ (unsigned)handleColor:(NSString *)color{
    unsigned rgbValue = 0; //此处只是声明一个 unsigned类型的变量，值没有任何的关系
    color = [color stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:color];
    //十六进制转十进制数字
    [scanner scanHexInt:&rgbValue];
    return rgbValue;
}

@end
