//
//  GHMSaleService.m
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMSaleService.h"
#import "GHMJsonRequest.h"

#import <Realm/Realm.h>

@implementation GHMSaleService

+ (void)syncSale {
    [GHMJsonRequest request:@"http://www.mocky.io/v2/5702e7c52700000a0906aee1" complete:^(NSError *error, NSDictionary *json) {
        NSArray *arraySale = [json objectForKey:@"data"];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            for (NSDictionary *JSONsale in arraySale) {
                [GHMSaleModel createOrUpdateInRealm:realm withValue:JSONsale];
            }
        }];
    }];
}

@end
