//
//  UIView+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//
@import UIKit;


@interface UIView (HLToolkit)

//positon
@property(nonatomic) CGSize size;
@property(nonatomic) CGPoint origin;

@property (nonatomic, readonly) UIViewController * viewController;
@property (nonatomic, readonly) UINavigationController * navigationController;
@property (nonatomic, readonly) UITabBarController * tabBarController;


//
-(void)awakeFromNib;
@end
