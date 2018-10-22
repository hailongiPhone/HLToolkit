//
//  NSUserDefaults+HLToolkit.h
//  HLToolkit
//
//  Created by hailong on 2018/10/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (HLToolkit)

+ (NSInteger)incrementIntegerForKey:(NSString*)key;

- (NSInteger)incrementIntegerForKey:(NSString*)key;
@end

NS_ASSUME_NONNULL_END
