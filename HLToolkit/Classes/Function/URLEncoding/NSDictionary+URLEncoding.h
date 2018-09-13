//
//  NSDictionary+URLEncoding.h
//  HLToolKit
//
//  Created by hl on 29/06/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (URLEncoding)

-(NSString*) urlEncodedQueryString;

+(NSDictionary *) dictionaryFromQueryString:(NSString *) query;

@end
