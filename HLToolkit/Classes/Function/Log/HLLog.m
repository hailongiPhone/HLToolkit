//
//  HLLog.m
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import "HLLog.h"
void ExtendNSLog(const char * _Nonnull file, int lineNumber, const char * _Nonnull function, NSString *format, ...) {
    va_list ap;
    
    va_start(ap, format);
    
    if (![format hasSuffix: @"\n"]) {
        format = [format stringByAppendingString: @"\n"];
    }
    
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    
    va_end(ap);
    
    NSString *functionName = [NSString stringWithFormat:@"%s", function];
    
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent].stringByDeletingPathExtension;

    fprintf(stderr, "%f %s:%d %s: %s", [[NSDate date] timeIntervalSince1970], [fileName UTF8String], lineNumber, [functionName UTF8String], [body UTF8String]);
    
 
}


@implementation HLLog

@end
