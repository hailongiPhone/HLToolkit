//
//  NSData+HLTKCryptor.h
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (HLTKCryptor)
- (NSData * )AES128EncryptWithKey:(NSString * )key;

- (NSData * )AES128DecryptWithKey:(NSString * )key;


- (NSData * )AES256EncryptWithKey:(NSString * )key;


- (NSData * )AES256DecryptWithKey:(NSString * )key;
@end

NS_ASSUME_NONNULL_END
