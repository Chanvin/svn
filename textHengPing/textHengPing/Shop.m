//
//  Shop.m
//  TaoBaoTest
//
//  Created by xilyk on 14-2-28.
//  Copyright (c) 2014年 ilyk. All rights reserved.
//

#import "Shop.h"

@implementation Shop

-(id)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        self.name=dict[@"name"];
        self.icon=dict[@"icon"];
        self.desc=dict[@"desc"];
    }
    return self;
}

+(id)shopWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
