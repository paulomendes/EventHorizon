//
//  EVHSwizzleUtils.m
//  Pods
//
//  Created by Paulo Mendes on 5/7/15.
//  Thanks to Colin Eberhardt (http://blog.scottlogic.com/ceberhardt/)
//

#import "EVHSwizzleUtils.h"
#import "objc/runtime.h"

@implementation EVHSwizzleUtils

+ (void)swizzleClass:(Class)swizzledClass method:(NSString *)methodName {
    SEL originalSelector = NSSelectorFromString(methodName);
    SEL overrideSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"override_", methodName]);
    
    Method originalMethod = class_getInstanceMethod(swizzledClass, originalSelector);
    Method newMethod = class_getInstanceMethod(swizzledClass, overrideSelector);
    
    method_exchangeImplementations(originalMethod, newMethod);
}


@end
