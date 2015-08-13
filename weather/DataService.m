//
//  DataService.m
//  weather
//
//  Created by Lucky on 15/8/13.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import "DataService.h"

@implementation DataService

//+ (void)requestUrl:(NSString *)urlString httpMethod:(NSString *)method params:(NSMutableDictionary *)params block:(BlockType)block

+ (void)requestUrl:(NSString *)urlString httpMethod:(NSString *)method block:(BlockType)block
{
    //01 构建url
    NSString *fullString = [BaseUrl stringByAppendingString:urlString];
    NSURL *url = [NSURL URLWithString:fullString];
    
    //02 构造request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:60];
    [request setHTTPMethod:method];
    
//    //03 拼接参数
//    NSArray *allKeys = [params allKeys];
//    NSMutableString *paramString = [[NSMutableString alloc] init];
//    for (int i = 0; i<allKeys.count; i++) {
//        NSString *key = allKeys[i];
//        NSString *value = [params objectForKey:key];
//        
//        [paramString appendFormat:@"%@=%@",key,value];
//        
//        if (i < allKeys.count-1) {
//            [paramString appendFormat:@"&"];
//        }
//    }
    
//    //如果是 GET请求， 则把参数拼接到url里面
//    if ([method isEqualToString:@"GET"]) {
//        //query url里面的参数
//        NSString *seperation = url.query?@"&":@"?";
//        NSString *paraUrlString = [NSString stringWithFormat:@"%@%@%@",fullString,seperation,paramString];
//        
//        request.URL = [NSURL URLWithString:paraUrlString];
//    }
    
    //04 connection请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response,NSData *data,NSError *connectionError){
        //数据接收完毕 处理数据
        if (connectionError != nil) {
            NSLog(@"网络请求失败");
        }
        
        NSData *strData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
         NSString *result = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];
        
        if (block) {
            block(result);
        }
    }];
}

@end


