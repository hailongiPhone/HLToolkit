//
//  NSUserDefaults+HLToolkit.m
//  HLToolkit
//
//  Created by hailong on 2018/10/18.
//

#import "NSUserDefaults+HLToolkit.h"

@implementation NSUserDefaults (HLToolkit)
+ (NSInteger)incrementIntegerForKey:(NSString*)key;
{
    return [[NSUserDefaults standardUserDefaults] incrementIntegerForKey:key];
}

- (NSInteger)incrementIntegerForKey:(NSString*)key;
{
    NSInteger value = [self integerForKey:key];
    value++;
    [self setInteger:value forKey:key];
    return value;
}
@end
