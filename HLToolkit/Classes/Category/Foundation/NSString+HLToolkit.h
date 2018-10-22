//
//  NSString+HLToolkit.h
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HLToolkit)
/**
 *  Used to calculate text height for max width and font
 *
 *  @param width Max width to fit text
 *  @param font  Font used in text
 *
 *  @return Returns the calculated height of string within width using given font
 */
- (CGFloat)heightForWidth:(float)width
                  andFont:(UIFont * _Nonnull)font;@end

NS_ASSUME_NONNULL_END
