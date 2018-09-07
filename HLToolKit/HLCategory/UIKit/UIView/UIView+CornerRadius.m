//
//  UIView+CornerRadius.m
//  HLToolKit
//
//  Created by hl on 2018/8/31.
//  Copyright © 2018 HL. All rights reserved.
//

#import "UIView+CornerRadius.h"

IB_DESIGNABLE
@implementation UIView (CornerRadius)

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius;
{
    return self.layer.cornerRadius;
}

- (void)prepareForInterfaceBuilder
{
    [super prepareForInterfaceBuilder];
//    self.layer.cornerRadius = 15;
}
@end
