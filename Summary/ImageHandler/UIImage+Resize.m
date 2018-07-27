//
//  UIImage+Resize.m
//  Summary
//
//  Created by Si on 2018/7/27.
//  Copyright © 2018年 Si. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

- (UIImage *)scaleImageToKb:(NSInteger)kb{
    CGFloat compression = 1; //压缩系数
    NSData *imageData = UIImageJPEGRepresentation(self, compression);
    //NSdata.length的单位为kb；小于指定大小时直接返回
    if (imageData.length < kb) return self;
    NSInteger before = [[self getNowTimeTimestamp3] integerValue];
    NSLog(@"压缩前时间戳%ld",(long)before);
    //明显可以感觉此方法有点慢
//    while (imageData.length > kb && compression > 0) {
//        compression -= 0.02;
//        imageData = UIImageJPEGRepresentation(self, compression);
//    }
    CGFloat max = 1,min = 0;
    //通过循环来减少压缩系数，知道达到指定的大小
    //    while (imageData.length > kb) {
    //        compression = (max + min) / 2;
    //        imageData = UIImageJPEGRepresentation(self, compression);
    //        if (imageData.length < kb * 0.9) { //保证图片大小在规定大小的90%~100%之间
    //            min = compression;
    //        }else if (imageData.length > kb){
    //            max = compression;
    //        }else{
    //            break;
    //        }
    //    }
    //图片压缩至一个固定的值就不会在压缩了 ，使用上面的会造成死循环 
    for (int i = 0 ; i < 6; i++) {
        compression = (max + min) / 2;
        imageData = UIImageJPEGRepresentation(self, compression);
        if (imageData.length < kb * 0.9) { //保证图片大小在规定大小的90%~100%之间
            min = compression;
        }else if (imageData.length > kb){
            max = compression;
        }else{
            break;
        }
    }
    NSInteger after = [[self getNowTimeTimestamp3] integerValue];
    NSLog(@"压缩后时间戳%ld",(long)after);
    NSLog(@"时间间隔：%ld",after - before);
    NSLog(@"图片压缩后的大小：%ld",imageData.length);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

//当前时间戳
-(NSString *)getNowTimeTimestamp3{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    return timeSp;
    
}



@end
