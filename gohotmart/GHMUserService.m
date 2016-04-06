//
//  GHMUserService.m
//  gohotmart
//
//  Created by Roberth Siqueira on 05/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMUserService.h"
#import "GHMJsonRequest.h"
#import <Realm/Realm.h>

@implementation GHMUserService

+(void)syncUser {
    [GHMJsonRequest request:@"http://www.mocky.io/v2/570460f00f00008a0ce5bb9c" complete:^(NSError *error, NSDictionary *json) {
        NSArray *arrayUser = [json objectForKey:@"data"];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            for (NSDictionary *JSONUser in arrayUser) {
                [GHMUserModel createOrUpdateInRealm:realm withValue:JSONUser];
            }
        }];
    }];
}
@end
