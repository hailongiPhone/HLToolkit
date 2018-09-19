//
//  UIApplication+HLToolkit.m
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//

#import "UIApplication+HLToolkit.h"

@implementation UIApplication (HLToolkit)
+ (NSString *)applicationName
{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"];
}

+ (NSString *)applicationVersion
{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}

+ (NSString *)applicationBuild
{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"];
}

+ (NSURL *)documentsDirectory
{
    NSError * error;
    NSURL * url = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                         inDomain:NSUserDomainMask
                                                appropriateForURL:nil
                                                           create:YES
                                                            error:&error];
    if (error)
    {
    }
    return url;
}

+ (NSURL *)cachesDirectory
{
    NSError * error;
    NSURL * url = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory
                                                         inDomain:NSUserDomainMask
                                                appropriateForURL:nil
                                                           create:YES
                                                            error:&error];
    if (error)
    {
        
    }
    return url;
}

+ (NSURL *)temporaryDirectory
{
    return [NSURL fileURLWithPath:NSTemporaryDirectory()
                      isDirectory:YES];
}

+ (NSURL *)libraryDirectory
{
    NSError * error;
    NSURL * url = [[NSFileManager defaultManager] URLForDirectory:NSLibraryDirectory
                                                         inDomain:NSUserDomainMask
                                                appropriateForURL:nil
                                                           create:YES
                                                            error:&error];
    if (error)
    {
    }
    return url;
}

#pragma mark -
+ (BOOL)isBackground;
{
    return [UIApplication sharedApplication].applicationState == UIApplicationStateBackground;
}
@end
