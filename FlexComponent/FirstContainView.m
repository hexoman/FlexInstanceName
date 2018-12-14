//
//  ContainView.m
//  FlexComponent
//
//  Created by zbt on 2018/12/14.
//  Copyright © 2018年 hexoman. All rights reserved.
//

#import "FirstContainView.h"
#import "SecondContainView.h"

@interface FirstContainView()

@property (nonatomic, strong)UILabel *secondLayerLab;

@property (nonatomic, strong)SecondContainView *containView2;

@end

@implementation FirstContainView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        
        self.containView2 = [[SecondContainView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
        [self addSubview:self.containView2];
        
        self.secondLayerLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.containView2.frame) + 20, 260, 20)];
        self.secondLayerLab.text = @"第二层lable";
        [self addSubview:self.secondLayerLab];
    }
    return self;
}
@end
