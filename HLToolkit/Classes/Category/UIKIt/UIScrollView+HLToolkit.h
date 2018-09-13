//
//  UIScrollView+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//

@import UIKit;

@interface UIScrollView (HLToolkit)
- (void)scrollToTopAnimated:(BOOL)animated;
- (IBAction)scrollToTop:(id)sender;
- (void)scrollToBottomAnimated:(BOOL)animated;
- (void)scrollToLeftAnimated:(BOOL)animated;
- (void)scrollToRightAnimated:(BOOL)animated;
@end
