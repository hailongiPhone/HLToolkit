//
//  NSString+convert.m
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import "NSString+convert.h"

@implementation NSString (convert)
- (NSData *)data;
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}
@end
