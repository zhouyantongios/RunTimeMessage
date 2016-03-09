//
//  UIImage+MyImage.m
//  RunTimeText
//
//  Created by 周彦彤 on 16/3/9.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import "UIImage+MyImage.h"
#import <objc/message.h>
@implementation UIImage (MyImage)

//load 方法为UIImage的系统方法,重写会自动调用父类方法
+ (void)load {
    //获取imageName 地址
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    
    //获取imageWithName地址
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    
    //交换两个方法的地址,实际上就是交换实现方式
    method_exchangeImplementations(imageName, imageWithName);
}

+ (instancetype)imageWithName:(NSString *)name {
    BOOL isIOS8 = [[UIDevice currentDevice].systemVersion floatValue] >= 8.0;
    UIImage *image = nil;
    if (isIOS8) {
        NSString *newName = [name stringByAppendingString:@"_iOS8+"];
        image = [UIImage imageWithName:newName];
    } else {
        //这里调用imageWithName 相当于调用imageName
        image = [self imageWithName:name];
    }
    
    if (image == nil) {
        NSLog(@"图片为空");
    }
    return image;
}

@end
