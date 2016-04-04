//
//  GHMJsonRequest.h
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompleteBlock)(NSError *error, id json);
@interface GHMJsonRequest : NSObject
+ (void) request:(NSString *)url complete:(CompleteBlock)completeBlock;
@end
