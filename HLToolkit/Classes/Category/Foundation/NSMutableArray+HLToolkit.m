//
//  NSMutableArray+HLToolkit.m
//  HLToolKit
//
//  Created by hailong on 2018/9/7.
//  Copyright © 2018年 HL. All rights reserved.
//

#import "NSMutableArray+HLToolkit.h"
static NSUInteger random_below(NSUInteger n) {
    NSUInteger m = 1;
    
    do {
        m <<= 1;
    } while(m < n);
    
    NSUInteger ret;
    
    do {
        ret = arc4random() % m;
    } while(ret >= n);
    
    return ret;
}
@implementation NSMutableArray (HLToolkit)
- (void)shuffle;
{
    // http://en.wikipedia.org/wiki/Knuth_shuffle
    for(NSUInteger i = [self count]; i > 1; i--) {
        NSUInteger j = random_below(i);
        [self exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
}

- (NSMutableArray *) removeFirstObject
{
    [self removeObjectAtIndex:0];
    return self;
}

- (NSMutableArray *) reverse
{
    for (int i=0; i<(floor([self count]/2.0)); i++)
        [self exchangeObjectAtIndex:i withObjectAtIndex:([self count]-(i+1))];
    return self;
}

@end
