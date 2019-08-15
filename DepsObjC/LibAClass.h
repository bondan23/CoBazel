//
//  LibAClass.h
//  DepsObjC
//
//  Created by Bondan Eko Prasetyo on 15/08/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LibAClass : NSObject
- (void)doSomething;
- (void)methodWithParameterBlock:(void (^)(BOOL something))block;
@end
