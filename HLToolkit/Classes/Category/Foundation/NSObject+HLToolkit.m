//
//  NSObject+HLToolkit.m
//  HLToolkit
//
//  Created by hailong on 2018/10/19.
//

#import "NSObject+HLToolkit.h"
#import <objc/runtime.h>

void swizzleClassMethod(Class cls, SEL origSelector, SEL newSelector)
{
    if (!cls) return;
    Method originalMethod = class_getClassMethod(cls, origSelector);
    Method swizzledMethod = class_getClassMethod(cls, newSelector);
    
    Class metacls = objc_getMetaClass(NSStringFromClass(cls).UTF8String);
    if (class_addMethod(metacls,
                        origSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod)) ) {
        /* swizzing super class method, added if not exist */
        class_replaceMethod(metacls,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        /* swizzleMethod maybe belong to super */
        class_replaceMethod(metacls,
                            newSelector,
                            class_replaceMethod(metacls,
                                                origSelector,
                                                method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod)),
                            method_getTypeEncoding(originalMethod));
    }
}

void swizzleInstanceMethod(Class cls, SEL origSelector, SEL newSelector)
{
    if (!cls) {
        return;
    }
    /* if current class not exist selector, then get super*/
    Method originalMethod = class_getInstanceMethod(cls, origSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, newSelector);
    
    /* add selector if not exist, implement append with method */
    if (class_addMethod(cls,
                        origSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod)) ) {
        /* replace class instance method, added if selector not exist */
        /* for class cluster , it always add new selector here */
        class_replaceMethod(cls,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        /* swizzleMethod maybe belong to super */
        class_replaceMethod(cls,
                            newSelector,
                            class_replaceMethod(cls,
                                                origSelector,
                                                method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod)),
                            method_getTypeEncoding(originalMethod));
    }
}


@implementation NSObject (HLToolkit)
- (id _Nonnull)performSelector:(SEL _Nonnull)aSelector withObjects:(id _Nullable)object, ... {
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if (signature) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:aSelector];
        
        va_list args;
        va_start(args, object);
        
        [invocation setArgument:&object atIndex:2];
        
        id arg = nil;
        int index = 3;
        while ((arg = va_arg(args, id))) {
            [invocation setArgument:&arg atIndex:index];
            index++;
        }
        
        va_end(args);
        
        [invocation invoke];
        if (signature.methodReturnLength) {
            id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}




+ (void)swizzleClassMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    swizzleClassMethod(self.class, origSelector, newSelector);
}

- (void)swizzleInstanceMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    swizzleInstanceMethod(self.class, origSelector, newSelector);
}


+ (void)dumpClassMethods;
{
    printf(" %s  classMethods\n  ",class_getName(object_getClass(self)));
    unsigned int classcount;
    Method *classmethods = class_copyMethodList(object_getClass([self class]), &classcount);
    for (int i = 0; i < classcount; i++) {
        Method method = classmethods[i];
        printf("    %s   typeEncode:%s\n",sel_getName(method_getName(method)),method_getTypeEncoding(method));
    }
    
    free(classmethods);
    
}

+ (void)dumpInstanceMethods;
{
    
    printf(" %s  instanceMethods\n  ",class_getName(object_getClass(self)));
    
    unsigned int count;
    Method *methods = class_copyMethodList(object_getClass(self), &count);
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        printf("    %s   typeEncode:%s\n",sel_getName(method_getName(method)),method_getTypeEncoding(method));
    }
    
    free(methods);
}

+ (void)dumpPropertys;
{
    
    printf(" %s  propertys\n  ",class_getName(object_getClass(self)));
    
    unsigned int count = 0;
    Class cls = object_getClass(self);
    objc_property_t * propertys = class_copyPropertyList(cls, &count);
    for (unsigned int i = 0 ; i<count; i++) {
        objc_property_t property = propertys[i];
        printf("   %s\n", property_getName(property));
    }
    
    free(propertys);
}

+ (void)dumpAll;
{
    [self dumpClassMethods];
    [self dumpInstanceMethods];
    [self dumpPropertys];
}
@end
