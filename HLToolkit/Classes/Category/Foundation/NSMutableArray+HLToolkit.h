//
//  NSMutableArray+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/7.
//  Copyright © 2018年 HL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (HLToolkit)
// Unbiased random rounding thingy.
- (NSMutableArray *) shuffle;

- (NSMutableArray *) removeFirstObject;
- (NSMutableArray *) reverse;
@end
