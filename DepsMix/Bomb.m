//
//  Bomb.m
//  DepsMix
//
//  Created by Bondan Eko Prasetyo on 15/08/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

#import "Bomb.h"
#ifdef BAZELBUILD
#import <DepsMix/TestMix-Swift.h>
#else
#import <DepsMix/DepsMix-Swift.h>
#endif

@implementation Bomb
    -(NSString *)explode {
        Weapon *weapon = [[Weapon alloc] init];
        
        NSLog(@"%@", weapon.name);
        
        return weapon.name;
    }
@end
