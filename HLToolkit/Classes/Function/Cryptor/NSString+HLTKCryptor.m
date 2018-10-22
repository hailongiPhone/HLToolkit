//
//  NSString+HLTKCryptor.m
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import "NSString+HLTKCryptor.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSData+HLTKCryptor.h"
#import "NSString+convert.h"
#import "NSData+convert.h"

@implementation NSString (HLTKCryptor)
#pragma mark - Hash
- (NSString *)MD5;
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
//    NSMutableString *ms = [NSMutableString string];
//    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
//        [ms appendFormat: @"%02x", (int)(digest[i])];
//    }
//    return [ms copy];
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            digest[0], digest[1], digest[2], digest[3],
            digest[4], digest[5], digest[6], digest[7],
            digest[8], digest[9], digest[10], digest[11],
            digest[12], digest[13], digest[14], digest[15]
            ];
}

- (NSString *)SHA1;
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    
    const char *cstr = self.UTF8String;
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(cstr, (CC_LONG)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    
    NSMutableString* output = [NSMutableString string];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString *)SHA256;
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    
    unsigned char digest[CC_SHA256_DIGEST_LENGTH], i;
    CC_SHA256([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}
- (NSString *)SHA512;
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    
    unsigned char digest[CC_SHA512_DIGEST_LENGTH], i;
    CC_SHA512([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

#pragma mark - symmetric encryption algorithm
#pragma mark - Advanced Encryption Standard
- (NSData * )AES128EncryptWithKey:(NSString * )key;
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    return [[self data] AES128EncryptWithKey:key];
}
- (NSData * )AES128DecryptWithKey:(NSString * )key;
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    return [[self data] AES128DecryptWithKey:key];
}

- (NSData * )AES256EncryptWithKey:(NSString * )key;
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    return [[self data] AES256EncryptWithKey:key];
}
- (NSData * )AES256DecryptWithKey:(NSString * )key;
{
    if (self == nil || [self length] == 0) {
        return nil;
    }
    return [[self data] AES256DecryptWithKey:key];
}

#pragma mark -
- (NSString * )encodeToBase64;
{
    NSData *data = [string data];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString * )decodeBase64;
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [data UTF8String];
}
@end
