//
//  GHMJsonRequest.m
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMJsonRequest.h"
#import <AFNetworking/AFNetworking.h>

@implementation GHMJsonRequest
+ (void)request:(NSString *)url complete:(CompleteBlock)completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completeBlock(nil, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(error, nil);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro de conexão"
                                                        message:@"Verifique sua conexão e tente novamente."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }];
}

@end
