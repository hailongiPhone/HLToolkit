//
//  NSString+URLEncoding.m
//  HLToolKit
//
//  Created by hl on 29/06/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "NSString+URLEncoding.h"
#import "NSDictionary+URLEncoding.h"

@implementation NSString (URLEncoding)
- (NSString *)urlEncode
{
//    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    [NSCharacterSet URLFragmentAllowedCharacterSet]
    NSCharacterSet *custom = [NSCharacterSet characterSetWithCharactersInString:@"?!@#$^&%*+,:;='\"`<>()[]{}/\\| "];
    return [self stringByAddingPercentEncodingWithAllowedCharacters:custom];
}

- (NSString *)urlDecode;
{
//    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self stringByRemovingPercentEncoding];
}
@end

@implementation NSString (QueryString)
- (NSDictionary *) queryDictionary;
{
    return [NSDictionary dictionaryFromQueryString:self];
}
@end
