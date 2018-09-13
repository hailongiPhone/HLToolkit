//
//  NSData_convert.h
//  HLToolKit
//
//  Created by hl on 02/08/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSData (convert)

- (NSString *)UTF8String;
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end
