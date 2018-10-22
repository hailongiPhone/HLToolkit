//
//  HLLog.h
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  Exented NSLog
 *
 *  @param file         File
 *  @param lineNumber   Line number
 *  @param functionName Function name
 *  @param format       Format
 */
void ExtendNSLog(const char * _Nonnull file, int lineNumber, const char * _Nonnull function, NSString * _Nonnull format, ...);

#ifdef DEBUG
    #define HLLog(args ...) ExtendNSLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args);

#else
    #define BFLog(args ...)
#endif

@interface HLLog : NSObject

@end

NS_ASSUME_NONNULL_END
