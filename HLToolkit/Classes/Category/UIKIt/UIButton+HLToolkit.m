//
//  UIButton+HLToolkit.m
//  HLToolkit
//
//  Created by hl on 2018/9/20.
//

#import "UIButton+HLToolkit.h"
#import "UIImage+HLToolkit.h"

@implementation UIButton (HLToolkit)
- (void)setBackgroundColor:(nullable UIColor *)color
                  forState:(UIControlState)state;
{
    [self setBackgroundImage:[UIImage imageFromColor:color]
                    forState:state];
}
@end
