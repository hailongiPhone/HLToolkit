//
//  NSDictionary+JSONValue.h
//  HLToolKit
//
//  Created by hl on 29/06/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONValue)
//default Not pretty print
- (NSData *)jsonData;
- (NSString *)jsonString;

- (NSData *)jsonDataWithPrettyPrint:(BOOL) prettyPrint;
- (NSString *)jsonStringWithPrettyPrint:(BOOL) prettyPrint;
@end
