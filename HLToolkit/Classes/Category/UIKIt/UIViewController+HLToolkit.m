//
//  UIViewController+HLToolkit.m
//  HLToolKit
//
//  Created by hailong on 2018/9/7.
//  Copyright © 2018年 HL. All rights reserved.
//

#import "UIViewController+HLToolkit.h"

@implementation UIViewController (HLToolkit)
- (id)currentVisibleViewController {
    if ([self isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)self;
        return [tabBarController.selectedViewController currentVisibleViewController];
    } else if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)self;
        return [[navigationController visibleViewController] currentVisibleViewController];
    }
    
    return self;
}

- (BOOL)isViewVisible {
    return [self isViewLoaded] && self.view.window != nil;
}

#pragma mark -

- (void)closeWithAnimated:(BOOL)animated completion: (void (^ __nullable)(void))completion;
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:animated completion:completion];
    }else if ([[self.navigationController viewControllers] count] > 1){
        [self.navigationController popViewControllerAnimated:animated];
        if (completion) {
            completion();
        }
    }
}

- (void)backWithAnimated:(BOOL)animated completion: (void (^ __nullable)(void))completion;
{
    if ([[self.navigationController viewControllers] count] > 1){
        [self.navigationController popViewControllerAnimated:animated];
    }else if (self.presentingViewController) {
        [self dismissViewControllerAnimated:animated completion:completion];
        if (completion) {
            completion();
        }
    }
}


- (IBAction)onTapClose:(id)sender;
{
    [self closeWithAnimated:YES
                completion:NULL];
}

- (IBAction)onTapBack:(id)sender;
{
    [self backWithAnimated:YES
                completion:NULL];
}

- (IBAction)pushViewController:(UIViewController *)destinationViewController
                hidesBottomBar:(BOOL)hides
                      animated:(BOOL)animated;
{
    BOOL current = self.hidesBottomBarWhenPushed;
    destinationViewController.hidesBottomBarWhenPushed = hides;
    self.hidesBottomBarWhenPushed = hides; // hide the tabBar when pushing B
    [self.navigationController pushViewController:destinationViewController animated:YES];
    self.hidesBottomBarWhenPushed = current; // for comeback to self
}

#pragma mark - 
- (UIViewController *)topmostViewControlle;
{
    if (self.presentedViewController) {
        return [self.presentedViewController topmostViewControlle];
    }
    
    if ([self isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tabbarVC =(UITabBarController *)self;
        return [tabbarVC.selectedViewController topmostViewControlle];
    }
    
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController * navVC =(UINavigationController *)self;
        return [navVC.visibleViewController topmostViewControlle];
    }
    
    return self;
}

@end
