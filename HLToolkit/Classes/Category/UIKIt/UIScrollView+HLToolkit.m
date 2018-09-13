//
//  UIScrollView+HLToolkit.m
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//

#import "UIScrollView+HLToolkit.h"

@implementation UIScrollView (HLToolkit)
#pragma mark - Scroll to edges

- (void)scrollToTopAnimated:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(self.contentOffset.x,
                                         0.0,
                                         1.0,
                                         1.0)
                     animated:animated];
}

- (IBAction)scrollToTop:(id)sender
{
    [self scrollToTopAnimated:YES];
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(self.contentOffset.x,
                                         self.contentSize.height - 1.0,
                                         1.0,
                                         1.0)
                     animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(0.0,
                                         self.contentOffset.y,
                                         1.0,
                                         1.0)
                     animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated
{
    [self scrollRectToVisible:CGRectMake(self.contentSize.width - 1.0,
                                         self.contentOffset.y,
                                         1.0,
                                         1.0)
                     animated:animated];
}
@end
