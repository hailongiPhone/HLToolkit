//
//  HLTKMacors.h
//  Pods
//
//  Created by hl on 2018/9/7.
//



#import "SynthesizeSingleton.h"


#define weakify(var) __weak typeof(var) HLWeak_##var = var;

#define strongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = HLWeak_##var; \
_Pragma("clang diagnostic pop")


