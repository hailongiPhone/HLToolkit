//
//  NSFileManager_NotBackupNotPurged.h
//  HLToolKit
//
//  Created by hl on 26/07/2017.
//   Copyright © 2018年 HL. All rights reserved.
//

#import "NSFileManager+NotBackupNotPurged.h"

@implementation  NSFileManager (NotBackupNotPurged)

+ (BOOL)notBackupNotPurgedFileUrl:(NSURL*) fileurl;
{
    NSError *error = nil;
    [fileurl setResourceValue:[NSNumber numberWithBool:YES]
                       forKey:NSURLIsExcludedFromBackupKey
                        error:&error];
    
    return error == nil;
}

+ (BOOL)notBackupNotPurgedFilePath:(NSString*) path;
{
    NSURL * fileUrl =  [NSURL fileURLWithPath:path];
    return [self notBackupNotPurgedFileUrl:fileUrl];
}
@end
