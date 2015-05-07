//
//  EVHSwizzleUtils.h
//  Pods
//
//  Created by Paulo Mendes on 5/7/15.
//
//

#import <Foundation/Foundation.h>

@interface EVHSwizzleUtils : NSObject

+ (void)swizzleClass:(Class)swizzledClass method:(NSString *)method;

@end
