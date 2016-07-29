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


/** 此处调用 imageName 执行交换方法后的 imageWithName */
+ (instancetype)imageWithName:(NSString *)name {
    
    BOOL isIOS8 = [[UIDevice currentDevice].systemVersion floatValue] >= 8.0;
    
    NSString *newName = nil;
    
    if (isIOS8) {
        newName = [name stringByAppendingString:@"_iOS8+"];
    } else {
        newName = name;
    }
    /** 此处调用 imageWithName 执行交换方法后的 imageName */
    UIImage *image = [UIImage imageWithName:newName];
    
    return image ? image:[UIImage imageWithName:name];
}

@end
