//
//  UIDevice+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/7.
//  Copyright © 2018年 HL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (HLToolkit)
// Available device memory in MB
@property(readonly) double availableMemory;

+ (NSString *)ipAddress;

+ (void)changeOrientation:(UIInterfaceOrientation)orientation;
@end
