//
//  WebGet.h
//  weather
//
//  Created by Lucky on 15/8/12.
//  Copyright (c) 2015年 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface WebGet : NSObject
@property (nonatomic) NSMutableArray *dataArray;

@property (nonatomic) Model *model;
- (void)loadData:(NSString *)tailStr;

@end
