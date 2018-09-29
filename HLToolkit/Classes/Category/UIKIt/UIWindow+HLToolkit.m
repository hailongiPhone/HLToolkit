//
//  UIWindow+HLToolkit.m
//  HLToolkit
//
//  Created by hl on 2018/9/29.
//

#import "UIWindow+HLToolkit.h"
#import "UIViewController+HLToolkit.h"

@implementation UIWindow (HLToolkit)
- (UIViewController *)topmostViewController;
{
    return self.rootViewController ? [self.rootViewController topmostViewControlle] : nil;
}

@end
