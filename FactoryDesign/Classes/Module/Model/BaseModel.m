//
//  BaseModel.m
//  FactoryDesign
//
//  Created by Dongxk on 2018/5/4.
//  Copyright © 2018年 Dongxk. All rights reserved.
//

#import "BaseModel.h"
#import "Model_One.h"
#import "Model_Two.h"
#import "Model_Three.h"

@implementation BaseModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    
    BaseModel *model = nil;
    if ([[dictionary objectForKey:@"tag"] isEqualToString:@"001"]) {
        model = [[Model_One alloc]init];
    }else if ([[dictionary objectForKey:@"tag"] isEqualToString:@"002"]) {
        model = [[Model_Two alloc]init];
    }else{
        model = [Model_Three new];
    }
    
    [model setValuesForKeysWithDictionary:dictionary];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
//    NSLog(@"key ---: %@", key);
}
@end
