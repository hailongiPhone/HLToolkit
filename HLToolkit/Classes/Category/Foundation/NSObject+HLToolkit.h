//
//  NSObject+HLToolkit.h
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HLToolkit)
/**
 *  Perform selector with unlimited objects
 *
 *  @param aSelector The selector
 *  @param object    The objects
 *
 *  @return An object that is the result of the message
 */
- (id _Nonnull)performSelector:(SEL _Nonnull)aSelector
                   withObjects:(id _Nullable)object, ... NS_REQUIRES_NIL_TERMINATION;


- (void)swizzleClassMethod:(SEL)origSelector withMethod:(SEL)newSelector;
- (void)swizzleInstanceMethod:(SEL)origSelector withMethod:(SEL)newSelector;

- (void)dumpClassMethods;
- (void)dumpInstanceMethods;
- (void)dumpPropertys;
- (void)dumpAll;

@end

NS_ASSUME_NONNULL_END
