//
//  NSDictionary+URLEncoding.m
//  HLToolKit
//
//  Created by hl on 29/06/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "NSDictionary+URLEncoding.h"
#import "NSString+URLEncoding.h"

@implementation NSDictionary (URLEncoding)

static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

-(NSString*) urlEncodedQueryString;
{
    NSMutableArray *parts = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(NSString * key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString * valueStr = toString(obj);
        NSString * part = [NSString stringWithFormat: @"%@=%@",
                           [key urlEncode],
                           [valueStr urlEncode]];
        [parts addObject: part];
    }];

    return [parts componentsJoinedByString: @"&"];
}

+(NSDictionary *) dictionaryFromQueryString:(NSString *) query;
{
    NSMutableDictionary *mutableParameterDictionary = [[NSMutableDictionary alloc] init];
    
    NSArray *parameters = [query componentsSeparatedByString:@"&"];
    
    for (NSString *parameter in parameters) {
        NSArray<NSString *> *keyValuePair = [parameter componentsSeparatedByString:@"="];
        
        if (keyValuePair.count == 2) {
            NSString *key = keyValuePair[0].urlDecode;
            NSString *value = keyValuePair[1].urlDecode;
            
            id existingValueForKey = mutableParameterDictionary[key];
            
            if (existingValueForKey) {
                if ([existingValueForKey isKindOfClass:[NSMutableArray class]])
                    [(NSMutableArray *)existingValueForKey addObject:value];
                else
                    [mutableParameterDictionary setObject:[NSMutableArray arrayWithObjects:existingValueForKey, value, nil]
                                                   forKey:key];
            } else
                [mutableParameterDictionary setObject:value forKey:key];
        }
    }
    
    return [mutableParameterDictionary copy];
}
@end
