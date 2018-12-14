  
## 快速定位控件的名字

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
  
