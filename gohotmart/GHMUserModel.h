//
//  GHMUserModel.h
//  gohotmart
//
//  Created by Roberth Siqueira on 05/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface GHMUserModel : RLMObject

@property NSInteger id;
@property NSString *name;
@property NSString *photo;
@property NSString *empityPhoto;
@property NSString *email;
@property NSString *balance;
@end
