//
//  GHMSaleService.h
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompleteSyncBlock)(BOOL contextDidSave, NSError *error);
@interface GHMSaleService : NSObject
+ (void) syncSale:(CompleteSyncBlock)completeSyncBlock;
@end
