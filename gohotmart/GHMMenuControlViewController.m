//
//  GHMMenuControlViewController.m
//  gohotmart
//
//  Created by Roberth Siqueira on 05/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMMenuControlViewController.h"
#import "UIViewController+AMSlideMenu.h"
#import "AMSlideMenuMainViewController.h"
#import "AMSlideMenuContentSegue.h"
#import "GHMUserModel.h"
#import "GHMUserService.h"
#import <Realm/Realm.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface GHMMenuControlViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIView *blurView;
@property (strong, nonatomic) IBOutlet UIView *userView;
@property (strong, nonatomic) IBOutlet UIImageView *photoImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) RLMResults<GHMUserModel *> *user;
@property (strong, nonatomic) RLMNotificationToken *token;

@end

@implementation GHMMenuControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshInfoUser];
}

- (void) refreshInfoUser {
    [GHMUserService syncUser];
    
    _token = [[GHMUserModel allObjects] addNotificationBlock:^(RLMResults<GHMUserModel *> *results, NSError * _Nullable error) {
        self.user = results;
        
        GHMUserModel *model = [self.user objectAtIndex:0];
        self.nameLabel.text = model.name;
        self.emailLabel.text = model.email;
        
        NSURL *photoUrl = [[NSURL alloc]init];
        if ([model.photo isEqualToString:@""]) {
            photoUrl = [NSURL URLWithString:model.empityPhoto];
        } else {
            photoUrl = [NSURL URLWithString:model.photo];
        }
        [self.photoImage sd_setImageWithURL:photoUrl];
        [self.backgroundImage sd_setImageWithURL:photoUrl];
        self.photoImage.layer.cornerRadius = self.photoImage.frame.size.width / 2;
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.blurView.frame;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        [self.blurView addSubview:blurEffectView];
    }];
}

- (void)openContentNavigationController:(UINavigationController *)nvc
{
#ifdef AMSlideMenuWithoutStoryboards
    AMSlideMenuContentSegue *contentSegue = [[AMSlideMenuContentSegue alloc] initWithIdentifier:@"contentSegue" source:self destination:nvc];
    [contentSegue perform];
#else
    NSLog(@"This methos is only for NON storyboard use! You must define AMSlideMenuWithoutStoryboards \n (e.g. #define AMSlideMenuWithoutStoryboards)");
#endif
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
