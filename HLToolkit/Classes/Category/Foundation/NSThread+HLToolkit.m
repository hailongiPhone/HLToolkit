//
//  NSThread+HLToolkit.m
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import "NSThread+HLToolkit.h"

@implementation NSThread (HLToolkit)
+ (void)asyncRunOnMainThread:(void(^)(void))handler;
{
    dispatch_async(dispatch_get_main_queue(), handler);
}
+ (void)syncRunOnMainThread:(void(^)(void))handler;
{
    if ([NSThread isMainThread]) {
        handler();
    }else{
        dispatch_sync(dispatch_get_main_queue(), handler);
    }
}
@end
