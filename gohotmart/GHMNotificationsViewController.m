//
//  GHMNotificationsViewController.m
//  gohotmart
//
//  Created by Roberth Siqueira on 06/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMNotificationsViewController.h"
#import "GHMMessageService.h"
#import "GHMMessageCellCollectionViewCell.h"
#import "GHMMessageModel.h"
#import "GHMSaleCellTableViewCell.h"
#import "GHMSaleService.h"
#import "GHMSaleModel.h"

#import <Realm/Realm.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIViewController+AMSlideMenu.h"

@interface GHMNotificationsViewController () <UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *balanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *numMsgLabel;
@property (strong, nonatomic) RLMResults<GHMMessageModel *> *messages;
@property (strong, nonatomic) IBOutlet UICollectionView *messagesCollectionView;
@property (strong, nonatomic) RLMResults<GHMSaleModel *> *sales;
@property (strong, nonatomic) IBOutlet UITableView *salesTableView;
@property (strong, nonatomic) IBOutlet UIView *loadingView;
@property (strong, nonatomic) RLMNotificationToken *tokenMessages;
@property (strong, nonatomic) RLMNotificationToken *tokenSales;

@end

@implementation GHMNotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshMessages];
    [self refreshSales];
}

- (void) refreshMessages {
    [self.loadingView setHidden:NO];
    [GHMMessageService syncMessage];
    _tokenMessages = [[GHMMessageModel allObjects] addNotificationBlock:^(RLMResults<GHMMessageModel *> *results, NSError * _Nullable error) {
        self.messages = results;
        self.numMsgLabel.text = [NSString stringWithFormat:@"+%ld", (long)self.messages.count];
        [self.loadingView setHidden:YES];
        [self.messagesCollectionView reloadData];
    }];
}

- (void) refreshSales {
    [self.loadingView setHidden:NO];
    [GHMSaleService syncSale];
    _tokenSales = [[GHMSaleModel allObjects] addNotificationBlock:^(RLMResults<GHMSaleModel *> *results, NSError * _Nullable error) {
        self.sales = results;
        [self.loadingView setHidden:YES];
        [self.salesTableView reloadData];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.messages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GHMMessageCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    GHMMessageModel *model = self.messages[indexPath.row];
    
    NSURL *photoUrl = [[NSURL alloc]init];
    if ([model.photo isEqualToString:@""]) {
        photoUrl = [NSURL URLWithString:model.empityPhoto];
    } else {
        photoUrl = [NSURL URLWithString:model.photo];
    }
    [cell.photoImage sd_setImageWithURL:photoUrl];
    cell.photoImage.layer.cornerRadius = cell.photoImage.frame.size.width / 2;
    cell.photoImage.clipsToBounds = YES;
    cell.nameLabel.text = model.name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sales.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GHMSaleCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SaleCell"];
    
    if (indexPath.row % 2 == 0) {
        [cell setBackgroundColor:[UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f]];
    } else {
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
    
    GHMSaleModel *model = self.sales[indexPath.row];
    
    cell.idLabel.text = [NSString stringWithFormat:@"%ld", (long)model.id];
    cell.titleLabel.text = model.title;
    cell.dateLabel.text = model.date;
    cell.priceLabel.text = model.price;
    
    return cell;
}

- (IBAction)openMenu:(UIButton *)sender {
    AMSlideMenuMainViewController *mainVC = [self mainSlideMenu];
    [mainVC openLeftMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
