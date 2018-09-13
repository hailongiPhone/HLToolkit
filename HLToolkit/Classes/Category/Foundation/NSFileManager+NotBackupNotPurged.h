//
//  NSFileManager_NotBackupNotPurged.h
//  HLToolKit
//
//  Created by hl on 26/07/2017.
//   Copyright © 2018年 HL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (NotBackupNotPurged)
+ (BOOL)notBackupNotPurgedFileUrl:(NSURL*) fileurl;
+ (BOOL)notBackupNotPurgedFilePath:(NSString*) path;
@end
