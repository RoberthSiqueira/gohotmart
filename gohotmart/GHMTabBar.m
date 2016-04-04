//
//  GHMTabBar.m
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMTabBar.h"

#define SIZE_OF_TABBAR 60

@implementation GHMTabBar

-(CGSize)sizeThatFits:(CGSize)size {
    CGSize sizeThatFits = [super sizeThatFits:size];
    sizeThatFits.height = SIZE_OF_TABBAR;
    
    return sizeThatFits;
}

@end
