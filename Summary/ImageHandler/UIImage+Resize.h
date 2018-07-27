//
//  UIImage+Resize.h
//  Summary
//
//  Created by Si on 2018/7/27.
//  Copyright © 2018年 Si. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

/**
 压缩图片到指定的大小

 @param kb 图片的大小，单位为kb
 @return 返回图片
 */
- (UIImage *)scaleImageToKb:(NSInteger)kb;

@end
