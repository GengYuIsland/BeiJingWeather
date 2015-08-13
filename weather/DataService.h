//
//  DataService.h
//  weather
//
//  Created by Lucky on 15/8/13.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>
#define BaseUrl @"http://www.weather.com.cn/adat/sk/"

typedef void (^BlockType)(NSString *result);
@interface DataService : NSObject

+ (void)requestUrl:(NSString *)urlString //url
        httpMethod:(NSString *)method //GET POST
             block:(BlockType)block; //接收到的数据的处理

@end
