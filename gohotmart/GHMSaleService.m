//
//  GHMSaleService.m
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMSaleService.h"
#import "GHMJsonRequest.h"
#import "GHMSaleModel.h"
#import <Realm/Realm.h>

@implementation GHMSaleService

+ (void)syncSale:(CompleteSyncBlock)completeSyncBlock {
    [GHMJsonRequest request:@"http://www.mocky.io/v2/57021d5e100000ff1890447d" complete:^(NSError *error, id json) {
        if (error) {
            completeSyncBlock(NO, error);
        } else {
            NSArray *arraySale = [json objectForKey:@"data"];
            
            RLMRealm *realm = [RLMRealm defaultRealm];
            
            [realm transactionWithBlock:^{
                for (NSData *JSONsale in arraySale) {
                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:JSONsale options:0 error:nil];
                    [GHMSaleModel createOrUpdateInRealm:realm withValue:json];
                }
            }];
        }
    }];
}

@end
