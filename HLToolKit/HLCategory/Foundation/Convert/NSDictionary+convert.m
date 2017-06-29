//
//  NSDictionary+convert.m
//  HLToolKit
//
//  Created by hl on 29/06/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "NSDictionary+convert.h"
@import UIKit;

@implementation NSDictionary (convert)

/**
 *  获取字符串
 *
 *  @param key 给定的key
 *
 *  @return 获得的字符串
 */
- (NSString*)stringForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return @"";
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}

/**
 *  获取number
 *
 *  @param key 给定的key
 *
 *  @return 获得的number
 */
- (NSNumber*)numberForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

/**
 *  获取array
 *
 *  @param key 给定的key
 *
 *  @return 获得的array
 */
- (NSArray*)arrayForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

/**
 *  获取dictionary
 *
 *  @param key 给定的key
 *
 *  @return 获得的dictionary
 */
- (NSDictionary*)dictionaryForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

/**
 *  获取initeger
 *
 *  @param key 给定的key
 *
 *  @return 获得的integer
 */
- (NSInteger)integerForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}

/**
 *  获取unsignedInteger
 *
 *  @param key 给定的key
 *
 *  @return 获得的unsignedInteger
 */
- (NSUInteger)unsignedIntegerForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}

/**
 *  获取bool
 *
 *  @param key 给定的key
 *
 *  @return 获得的bool
 */
- (BOOL)boolForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}

/**
 *  获取int16
 *
 *  @param key 给定的key
 *
 *  @return 获得的int16
 */
- (int16_t)int16ForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

/**
 *  获取int32
 *
 *  @param key 给定的key
 *
 *  @return 获得的int32
 */
- (int32_t)int32ForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

/**
 *  获取int64
 *
 *  @param key 给定的key
 *
 *  @return 获得的int64
 */
- (int64_t)int64ForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

/**
 *  获取char
 *
 *  @param key 给定的key
 *
 *  @return 获得的char
 */
- (char)charForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

/**
 *  获取short
 *
 *  @param key 给定的key
 *
 *  @return 获得的short
 */
- (short)shortForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

/**
 *  获取float
 *
 *  @param key 给定的key
 *
 *  @return 获得的float
 */
- (float)floatForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}

/**
 *  获取double
 *
 *  @param key 给定的key
 *
 *  @return 获得的double
 */
- (double)doubleForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

/**
 *  获取longLong
 *
 *  @param key 给定的key
 *
 *  @return 获得的longLong
 */
- (long long)longLongForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

/**
 *  获取unsignedLongLong
 *
 *  @param key 给定的key
 *
 *  @return 获得的unsignedLongLong
 */
- (unsigned long long)unsignedLongLongForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

/**
 *  获取CGFloat
 *
 *  @param key 给定的key
 *
 *  @return 获得的CGFloat
 */
- (CGFloat)CGFloatForKey:(id)key {
    CGFloat f = [self[key] doubleValue];
    return f;
}

/**
 *  获取point
 *
 *  @param key 给定的key
 *
 *  @return 获得的point
 */
- (CGPoint)pointForKey:(id)key {
    CGPoint point = CGPointFromString(self[key]);
    return point;
}

/**
 *  获取size
 *
 *  @param key 给定的key
 *
 *  @return 获得的size
 */
- (CGSize)sizeForKey:(id)key {
    CGSize size = CGSizeFromString(self[key]);
    return size;
}

/**
 *  获取rect
 *
 *  @param key 给定的key
 *
 *  @return 获得的rect
 */
- (CGRect)rectForKey:(id)key {
    CGRect rect = CGRectFromString(self[key]);
    return rect;
}

@end
