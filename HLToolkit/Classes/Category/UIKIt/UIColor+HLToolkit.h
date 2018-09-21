//
//  UIColor+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/7.
//  Copyright © 2018年 HL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HLToolkit)
+ (UIColor *)randomColor;
+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithAHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end
