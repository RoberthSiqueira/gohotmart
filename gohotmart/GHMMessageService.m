//
//  GHMMessageService.m
//  gohotmart
//
//  Created by Roberth Siqueira on 05/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMMessageService.h"
#import "GHMJsonRequest.h"

@implementation GHMMessageService

+ (void)syncMessage {
    [GHMJsonRequest request:@"http://www.mocky.io/v2/57034246270000471506af06" complete:^(NSError *error, NSDictionary *json) {
        NSArray *arrayMessage = [json objectForKey:@"data"];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            for (NSDictionary *JSONMessage in arrayMessage) {
                [GHMMessageModel createOrUpdateInRealm:realm withValue:JSONMessage];
            }
        }];
    }];
}
@end
