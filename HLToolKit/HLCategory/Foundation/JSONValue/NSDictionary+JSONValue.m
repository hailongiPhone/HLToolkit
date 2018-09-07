//
//  NSDictionary+JSONValue.m
//  HLToolKit
//
//  Created by hl on 29/06/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "NSDictionary+JSONValue.h"

@implementation NSDictionary (JSONValue)
#pragma mark - Data

- (NSData *)jsonDataWithPrettyPrint:(BOOL) prettyPrint;
{
    return [NSJSONSerialization dataWithJSONObject:self
                                           options:(prettyPrint?NSJSONWritingPrettyPrinted : kNilOptions)
                                             error:nil];
}

- (NSData *)jsonData;
{
    return [self jsonDataWithPrettyPrint:NO];
}

#pragma mark - String
- (NSString *)jsonString;
{
    return [self jsonStringWithPrettyPrint:NO];
}

- (NSString *)jsonStringWithPrettyPrint:(BOOL) prettyPrint;
{
    NSData * data = [self jsonDataWithPrettyPrint:prettyPrint];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
