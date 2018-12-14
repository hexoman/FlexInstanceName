//
//  UIResponder+GetInstanceName.m
//  FlexComponent
//
//  Created by zbt on 2018/12/14.
//  Copyright © 2018年 hexoman. All rights reserved.
//

#import "UIResponder+GetInstanceName.h"
#import <objc/runtime.h>

@implementation UIResponder (GetInstanceName)

//递归寻找控件名字
- (NSString *)getNameWithInstanceView:(id)view {
    //思路是利用runtime获取到当前view的父view的对象成员列表，然后再遍历成员对象列表看看哪个符合
    unsigned int numCount = 0;
    NSString *property = nil;
    Ivar * ivars = class_copyIvarList([self class], &numCount);
    for(int i = 0; i < numCount; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        //判断成员变量是否是当前view
        if (object_getIvar(self, thisIvar) == view) {
            property = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
            break;
        }
    }
    free(ivars);
    return property;
}

- (NSString *)getPropertyName:(UIView *)view {
    NSString *property = [self getNameWithInstanceView:view];
    //如果没有找到，那么层层递归响应链寻找下一responder
    if (!property) {
        //获取到响应链上下一个响应者
        id nextResponder = [self nextResponder];
        return [nextResponder getPropertyName:view];
    }
    if ([property hasPrefix:@"_"]) {
        property = [property substringFromIndex:1];
    }
    return property;
}
@end
