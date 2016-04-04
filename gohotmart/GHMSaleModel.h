//
//  GHMSaleModel.h
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import <Realm/Realm.h>
#import <Foundation/Foundation.h>

@interface GHMSaleModel : RLMObject

@property NSInteger id;
@property NSString *title;
@property NSString *date;
@property NSString *price;

+ (NSString *)primaryKey;
@end
