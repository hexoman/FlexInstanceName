//
//  ViewController.m
//  FlexComponent
//
//  Created by zbt on 2018/12/13.
//  Copyright © 2018年 hexoman. All rights reserved.
//

#import "ViewController.h"
#import "FirstContainView.h"

@interface ViewController ()

@property (nonatomic, strong)FirstContainView *containView1;

@property (nonatomic, strong)UILabel *firstLayerLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.containView1 = [[FirstContainView alloc] initWithFrame:CGRectMake(10, 150, 400, 400)];
    [self.view addSubview:self.containView1];
    
    self.firstLayerLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.containView1.frame) + 20, 300, 20)];
    self.firstLayerLab.text = @"第一层lable";
    [self.view addSubview:self.firstLayerLab];
   
}



@end
