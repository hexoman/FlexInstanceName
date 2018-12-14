  该工具类的实现基于神器Flex的，大家首先可以在自己的工程中cocoaPods集成Flex。需要修改一部分Flex的源码，这里的改动只要是在**FLEXExplorerToolbar**里面添加一个按钮，使之可以触发现实控件名的弹框。
```
 UIImage *showImageIcon = nil;
 self.showPropertyItem = [FLEXToolbarItem toolbarItemWithTitle:@"show" image:showImageIcon];
 [self addSubview:self.showPropertyItem];
 [toolbarItems addObject:self.showPropertyItem];
```
  操作步骤也比较简单，用flex中的select选中控件后，点击toolbar最后面的show，即会弹出该控件的名字，方便快速查找和定位代码。
  
  
  ![Image text](https://github.com/hexoman/imageFloder/blob/master/flex1.png)
  
  
  ![Image text](https://github.com/hexoman/imageFloder/blob/master/flex2.png)
  
  
  ![Image text](https://github.com/hexoman/imageFloder/blob/master/flex3.png)
  
  
  核心的工具类主要是 UIResponder+GetInstanceName。思路是利用runtime在响应链递归寻找选中控件的成员变量名。
  
 ```
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

 ```
  
  
