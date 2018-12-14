//
//  UIResponder+GetInstanceName.h
//  FlexComponent
//
//  Created by zbt on 2018/12/14.
//  Copyright © 2018年 hexoman. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (GetInstanceName)

- (NSString *)getPropertyName:(UIView *) instance;

@end

NS_ASSUME_NONNULL_END
