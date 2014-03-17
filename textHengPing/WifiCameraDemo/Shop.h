//
//  Shop.h
//  TaoBaoTest
//
//  Created by xilyk on 14-2-28.
//  Copyright (c) 2014年 ilyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * icon;
@property(nonatomic,strong)NSString * desc;

-(id)initWithDict:(NSDictionary *)dict;
+(id)shopWithDict:(NSDictionary *)dict;

@end
