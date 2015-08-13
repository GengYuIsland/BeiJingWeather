//
//  WebGet.m
//  weather
//
//  Created by Lucky on 15/8/12.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import "WebGet.h"

@implementation WebGet
{
//    NSInteger index;
    
//    NSMutableArray *dataArray;
    NSMutableDictionary *dic;
    

}
- (id)init
{
    self = [super init];
    if (self) {
//        index = 101010300;
//        dataArray = [[NSMutableArray alloc] init];
        dic = [[NSMutableDictionary alloc] init];
        _model = [[Model alloc] init];
    }
    
    return self;
}


- (void)loadData:(NSString *)tailStr
{
    NSString *basicStr = @"http://www.weather.com.cn/adat/sk/";
    

    
    NSString *path = [NSString stringWithFormat:@"%@%@",basicStr,tailStr];
        
    NSURL *url = [NSURL URLWithString:path];

       //构造request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:60];
    [request setHTTPMethod:@"GET"];
        
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *weatherDic = [dic objectForKey:@"weatherinfo"];
    


    _model.city = [weatherDic objectForKey:@"city"];
    _model.temp = [weatherDic objectForKey:@"temp"];
    _model.WD = [weatherDic objectForKey:@"WD"];//风向
    _model.WS = [weatherDic objectForKey:@"WS"];//风级
    _model.SD = [weatherDic objectForKey:@"SD"];//湿度
    _model.time = [weatherDic objectForKey:@"time"];


    

        

        
//    }
    
    
    
}

@end
