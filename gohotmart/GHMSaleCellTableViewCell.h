//
//  GHMCellTableViewCell.h
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHMSaleCellTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *idLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@end
