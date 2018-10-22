//
//  NSString+HLTKCryptor.h
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HLTKCryptor)
- (NSString *)MD5;

- (NSString *)SHA1;       //Secure Hash Algorithm
- (NSString *)SHA256;
- (NSString *)SHA512;

- (NSData * )AES128EncryptWithKey:(NSString * )key;
- (NSData * )AES128DecryptWithKey:(NSString * )key;

- (NSData * )AES256EncryptWithKey:(NSString * )key;
- (NSData * )AES256DecryptWithKey:(NSString * )key;


- (NSString * )encodeToBase64;
- (NSString * )decodeBase64;
@end

NS_ASSUME_NONNULL_END
