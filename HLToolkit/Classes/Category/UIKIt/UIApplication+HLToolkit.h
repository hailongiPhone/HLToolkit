//
//  UIApplication+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (HLToolkit)

@property (nonatomic, readonly,class) NSString * applicationName;
@property (nonatomic, readonly,class) NSString * applicationVersion;
@property (nonatomic, readonly,class) NSString * applicationBuild;


@property (nonatomic, readonly,class) NSURL * documentsDirectory;
@property (nonatomic, readonly,class) NSURL * cachesDirectory;
@property (nonatomic, readonly,class) NSURL * temporaryDirectory;
@property (nonatomic, readonly,class) NSURL * libraryDirectory;

+ (BOOL)isBackground;
@end
