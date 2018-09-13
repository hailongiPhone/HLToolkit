//
//  UIApplication+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (HLToolkit)

@property (nonatomic, readonly) NSString * applicationName;
@property (nonatomic, readonly) NSString * applicationVersion;
@property (nonatomic, readonly) NSString * applicationBuild;


@property (nonatomic, readonly) NSURL * documentsDirectory;
@property (nonatomic, readonly) NSURL * cachesDirectory;
@property (nonatomic, readonly) NSURL * temporaryDirectory;
@property (nonatomic, readonly) NSURL * libraryDirectory;
@end
