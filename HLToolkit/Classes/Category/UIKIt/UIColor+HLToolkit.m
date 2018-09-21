//
//  UIColor+HLToolkit.m
//  HLToolKit
//
//  Created by hailong on 2018/9/7.
//  Copyright © 2018年 HL. All rights reserved.
//

#import "UIColor+HLToolkit.h"

@implementation UIColor (HLToolkit)
+ (UIColor *)randomColor {
    int red = arc4random() % 255 / 255.0;
    int green = arc4random() % 255 / 255.0;
    int blue = arc4random() % 255 / 255.0;
    return [UIColor colorWithRed:red
                           green:green
                            blue:blue
                           alpha:1.0f];
}

+ (UIColor *)colorWithHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)colorWithAHex:(UInt32)hex {
    int a = (hex >> 24) & 0xFF;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:a / 255.0f];
}

// Returns a UIColor by scanning the string for a hex number and passing that to +[UIColor colorWithRGBHex:]
// Skips any leading whitespace and ignores any trailing characters
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    [scanner setCharactersToBeSkipped:[NSCharacterSet alphanumericCharacterSet].invertedSet];
    NSInteger length = [stringToConvert length];
    if ([stringToConvert hasPrefix:@"#"]) {
        [scanner setScanLocation:1];
        length -= 1;
    }
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) {
        return nil;
    }
    
    UInt32 a = 0xFF, r=0, g=0, b=0;
    switch (length) {
        case 3: // RGB (12-bit)
        {
            r = ((hexNum >> 8) & 0xF) * 17;
            g = ((hexNum >> 4) & 0xF) * 17;
            b = ((hexNum) & 0xF) * 17;
        }
            break;
        case 6: // RGB (24-bit)
        {
            r = (hexNum >> 16) & 0xFF;
            g = (hexNum >> 8) & 0xFF;
            b = (hexNum) & 0xFF;
        }
            break;
        case 8: // ARGB (32-bit)
        {
            a = (hexNum >> 24) & 0xFF;
            r = (hexNum >> 16) & 0xFF;
            g = (hexNum >> 8) & 0xFF;
            b = (hexNum) & 0xFF;
            
        }
            break;
    }
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:a / 255.0f];
}
@end
