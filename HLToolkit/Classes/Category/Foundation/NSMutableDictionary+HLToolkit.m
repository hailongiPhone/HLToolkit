//
//  NSMutableDictionary+HLToolkit.m
//  HLToolKit
//
//  Created by hailong on 2018/9/7.
//  Copyright © 2018年 HL. All rights reserved.
//

#import "NSMutableDictionary+HLToolkit.h"

@implementation NSMutableDictionary (HLToolkit)
- (void)setPoint:(CGPoint)value forKey:(NSString *)key
{
    NSDictionary *dictionary = (__bridge id)(CGPointCreateDictionaryRepresentation(value));
    [self setValue:dictionary forKey:key];
}

- (void)setSize:(CGSize)value forKey:(NSString *)key
{
    NSDictionary *dictionary = (__bridge id)(CGSizeCreateDictionaryRepresentation(value));
    [self setValue:dictionary forKey:key];
}

- (void)setRect:(CGRect)value forKey:(NSString *)key
{
    NSDictionary *dictionary = (__bridge id)(CGRectCreateDictionaryRepresentation(value));
    [self setValue:dictionary forKey:key];
}
@end
