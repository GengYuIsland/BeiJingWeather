//
//  ViewController.m
//  weather
//
//  Created by Lucky on 15/8/12.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import "ViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
{
    NSInteger index;
    NSString *tailStr;
    
    
    
    NSMutableArray *cityArray;
    
    
    NSInteger pickerIndex;
    
    UIView *textView;
    
    
    //city
    UILabel *cityLable;

    
    //temp
    UILabel *tempLable;

    
    //WD
    UILabel *wdLable;

    
    //ws
    UILabel *wsLable ;

    
    //SD
    UILabel *sdLable ;

    
    //time
    UILabel *timeLable ;

    

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationItem setTitle:@"天气预报"];
    UIBarButtonItem *enquiriesBarButton = [[UIBarButtonItem alloc] initWithTitle:@"查询" style:UIBarButtonItemStylePlain target:self action:@selector(enquiriesAction:)];
    [self.navigationItem setRightBarButtonItem:enquiriesBarButton];
    
    [self setPickerView];

    
    index = 101010300;
    

    
    [self setModalArray:_modalArray];
    
    [self _createTextViews];
    
    cityArray = [[NSMutableArray alloc] init];
    _modalArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 14; i ++) {
        tailStr = [NSString stringWithFormat:@"%ld.html",index];
        
        index += 100;
        
        WebGet *we = [[WebGet alloc] init];
        
        [we loadData:tailStr];
        
//      NSLog(@"%@",we.model.city);
        
        
        
        [_modalArray addObject:we.model];
        [cityArray addObject:we.model.city];
        
        NSLog(@"%@",_modalArray);
        
        
    }
    

    
}

//- (void)setModalArray:(NSMutableArray *)modalArray
//{
//
//}

#pragma mark - delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//    NSLog(@"_modalArray.count = %ld",_modalArray.count);
    return _modalArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return cityArray[row];

}

- (void)enquiriesAction:(UIBarButtonItem *)buttonItem
{
//    [DataService requestUrl:@"101010300.html" httpMethod:@"GET" block:^(NSString *result)
//     {
////         NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
//         
//
//         NSLog(@"%@",result);
//
//     }];
}
//监听UIPickerView的滚动
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    Model *selectModel = [[Model alloc] init];
    selectModel = [_modalArray objectAtIndex:row];
    NSLog(@"%@",selectModel.city);
    
    cityLable.text = [NSString stringWithFormat:@"城市：%@",selectModel.city];
    tempLable.text = [NSString stringWithFormat:@"温度：%@",selectModel.temp];
    wdLable.text = [NSString stringWithFormat:@"风向：%@",selectModel.WD];
    wsLable.text = [NSString stringWithFormat:@"风级：%@",selectModel.WS];
    sdLable.text = [NSString stringWithFormat:@"湿度：%@",selectModel.SD];
    timeLable.text = [NSString stringWithFormat:@"发布时间：%@",selectModel.time];
    
    
}

- (void)setPickerView
{
    _cityPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kHeight/3*2, kWidth, kHeight/3)];
    [self.view addSubview:_cityPickerView];
    _cityPickerView.backgroundColor = [UIColor grayColor];
    _cityPickerView.delegate = self;
    _cityPickerView.dataSource = self;
}

#pragma mark - textView
- (void)_createTextViews
{
    
    
    textView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, kWidth, kHeight/3*2)];
    [self.view addSubview:textView];
    
    //city
    cityLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 30)];
    [textView addSubview:cityLable];
    cityLable.textColor = [UIColor orangeColor];
    
    //temp
    tempLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 180, 30)];
    [textView addSubview:tempLable];
    tempLable.textColor = [UIColor orangeColor];
    
    //WD
    wdLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 180, 30)];
    [textView addSubview:wdLable];
    wdLable.textColor = [UIColor orangeColor];
    
    //ws
    wsLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 180, 30)];
    [textView addSubview:wsLable];
    
    //SD
    sdLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, 180, 30)];
    [textView addSubview:sdLable];
    
    //time
    timeLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 180, 30)];
    [textView addSubview:timeLable];
    
    Model *selectModel = [[Model alloc] init];
    selectModel = [_modalArray objectAtIndex:0];
    NSLog(@"%@",selectModel.city);
    
    cityLable.text = selectModel.city;
    tempLable.text = selectModel.temp;
    wdLable.text = selectModel.WD;
    wsLable.text = selectModel.WS;
    sdLable.text = selectModel.SD;
    timeLable.text = selectModel.time;
}


@end
