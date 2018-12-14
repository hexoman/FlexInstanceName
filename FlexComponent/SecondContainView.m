//
//  SecondContainView.m
//  FlexComponent
//
//  Created by zbt on 2018/12/14.
//  Copyright © 2018年 hexoman. All rights reserved.
//

#import "SecondContainView.h"

@implementation SecondContainView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        
        self.thirdLayerLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 300, 20)];
        self.thirdLayerLab.text = @"第三层label";
        [self addSubview:self.thirdLayerLab];
    }
    return self;
}

@end
