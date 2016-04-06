//
//  GHMSalesViewController.m
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMSalesViewController.h"
#import "GHMSaleCellTableViewCell.h"
#import "GHMSaleService.h"
#import "GHMSaleModel.h"
#import <Realm/Realm.h>
#import "UIViewController+AMSlideMenu.h"

@interface GHMSalesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) RLMResults<GHMSaleModel *> *sales;
@property (strong, nonatomic) IBOutlet UITableView *salesTableView;
@property (strong, nonatomic) RLMNotificationToken *token;
@property (strong, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation GHMSalesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.loadingView setHidden:NO];
    
    [GHMSaleService syncSale];
    
    _token = [[GHMSaleModel allObjects] addNotificationBlock:^(RLMResults<GHMSaleModel *> *results, NSError * _Nullable error) {
        self.sales = results;
        [self.loadingView setHidden:YES];
        [self.salesTableView reloadData];
    }];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sales.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GHMSaleCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SaleCell"];
    
    if (indexPath.row % 2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
    } else {
        [cell setBackgroundColor:[UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f]];
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

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
