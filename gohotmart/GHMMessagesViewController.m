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
#import "UIViewController+AMSlideMenu.h"

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
    [self refreshMessages];
}

- (void) refreshMessages {
    [self.loadingView setHidden:NO];
    [GHMMessageService syncMessage];
    _token = [[GHMMessageModel allObjects] addNotificationBlock:^(RLMResults<GHMMessageModel *> *results, NSError * _Nullable error) {
        self.messages = results;
        self.numMsgLabel.text = [NSString stringWithFormat:@"+%ld", (long)self.messages.count];
        [self.loadingView setHidden:YES];
        [self.messagesCollectionView reloadData];
    }];
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
    cell.photoImage.layer.cornerRadius = cell.photoImage.frame.size.width / 2;
    cell.photoImage.clipsToBounds = YES;
    cell.nameLabel.text = model.name;
    
    return cell;

}

- (IBAction)openMenu:(UIButton *)sender {
    AMSlideMenuMainViewController *mainVC = [self mainSlideMenu];
    [mainVC openLeftMenu];
}

@end
