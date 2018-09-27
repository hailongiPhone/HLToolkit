//
//  UIViewController+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/7.
//  Copyright © 2018年 HL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HLToolkit)
- (id)currentVisibleViewController;
- (BOOL)isViewVisible;

- (void)closeWithAnimated:(BOOL)animated completion: (void (^ __nullable)(void))completion;
- (void)backWithAnimated:(BOOL)animated completion: (void (^ __nullable)(void))completion;
- (IBAction)onTapClose:(id)sender;
- (IBAction)onTapBack:(id)sender;

@end
