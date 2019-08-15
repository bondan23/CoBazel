//
//  LibAClass.m
//  DepsObjC
//
//  Created by Bondan Eko Prasetyo on 15/08/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

#import "LibAClass.h"

@implementation LibAClass
- (void)doSomething {
    NSLog(@"LibAClass doSomething");
}

- (void)methodWithParameterBlock:(void (^)(BOOL))block {
    block(NO);
}
@end
