//
//  GHMMessagesViewController.m
//  gohotmart
//
//  Created by Roberth Siqueira on 05/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMMessagesViewController.h"
#import "GHMMessageModel.h"
#import "GHMMessageCellCollectionViewCell.h"
#import "GHMMessageService.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface GHMMessagesViewController () <UICollectionViewDataSource>
@property (strong, nonatomic) RLMResults<GHMMessageModel *> *messages;
@property (strong, nonatomic) IBOutlet UICollectionView *messagesCollectionView;
@property (strong, nonatomic) RLMNotificationToken *token;
@property (strong, nonatomic) IBOutlet UIView *loadingView;
@property (strong, nonatomic) IBOutlet UILabel *numMsgLabel;
@end

@implementation GHMMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loadingView setHidden:NO];
    [GHMMessageService syncMessage];
    
    _token = [[GHMMessageModel allObjects] addNotificationBlock:^(RLMResults<GHMMessageModel *> *results, NSError * _Nullable error) {
        self.messages = results;
        [self.loadingView setHidden:YES];
        self.numMsgLabel.text = [NSString stringWithFormat:@"+%ld", (long)self.messages.count];
        [self.messagesCollectionView reloadData];
    }];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.messages.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GHMMessageCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    GHMMessageModel *model = self.messages[indexPath.row];
    
    NSURL *photoUrl = [[NSURL alloc]init];
    if ([model.photo isEqualToString:@""]) {
        photoUrl = [NSURL URLWithString:model.empityPhoto];
    } else {
        photoUrl = [NSURL URLWithString:model.photo];
        cell.alertImage.image = [UIImage imageNamed:@"ico_alert.png"];
    }
    [cell.photoImage sd_setImageWithURL:photoUrl];
    cell.photoImage.layer.cornerRadius = cell.photoImage.frame.size.width /2;
    cell.nameLabel.text = model.name;
    
    return cell;

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
