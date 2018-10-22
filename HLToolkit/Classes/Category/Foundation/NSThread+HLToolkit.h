//
//  NSThread+HLToolkit.h
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSThread (HLToolkit)
+ (void)asyncRunOnMainThread:(void(^)(void))handler;
+ (void)syncRunOnMainThread:(void(^)(void))handler;

@end

NS_ASSUME_NONNULL_END
