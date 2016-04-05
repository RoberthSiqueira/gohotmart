//
//  GHMMessagesModel.h
//  gohotmart
//
//  Created by Roberth Siqueira on 05/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface GHMMessageModel : RLMObject

@property NSInteger id;
@property NSString *name;
@property NSString *photo;

+ (NSString *)primaryKey;

@end
