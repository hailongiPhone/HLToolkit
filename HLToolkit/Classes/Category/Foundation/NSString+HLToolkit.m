//
//  NSString+HLToolkit.m
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import "NSString+HLToolkit.h"

@implementation NSString (HLToolkit)
- (CGFloat)heightForWidth:(float)width andFont:(UIFont * _Nonnull)font {
    CGSize size = CGSizeZero;
    if (self.length > 0) {
        CGRect frame = [self boundingRectWithSize:CGSizeMake(width, 999999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName: font } context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height + 1);
    }
    return size.height;
}
@end
