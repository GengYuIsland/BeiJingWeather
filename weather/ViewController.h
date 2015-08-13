//
//  ViewController.h
//  weather
//
//  Created by Lucky on 15/8/12.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebGet.h"
#import "DataService.h"
#import "Model.h"

@interface ViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
{
    Model *model;
}
@property (nonatomic) UIPickerView *cityPickerView;
@property (nonatomic) NSMutableArray *modalArray;
@end

