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
#import <SDWebImage/UIImageView+WebCache.h>

@interface GHMMenuControlViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIView *blurView;
@property (strong, nonatomic) IBOutlet UIView *userView;
@property (strong, nonatomic) IBOutlet UIImageView *photoImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation GHMMenuControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshInfoUser];
}

- (void) refreshInfoUser {
        self.nameLabel.text = @"Roberth Siqueira";
        self.nameLabel.text = [self.nameLabel.text uppercaseString];
        self.emailLabel.text = @"roberth.siqueira@gmail.com";
        NSURL *photoUrl = [[NSURL alloc]init];
        photoUrl = [NSURL URLWithString:@"https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAStAAAAJDQ3ZDEzN2VjLTA5YjctNGNmMy05NWVkLTgyMjdlMzA5Mjg0MQ.jpg"];
        [self.photoImage sd_setImageWithURL:photoUrl];
        [self.backgroundImage sd_setImageWithURL:photoUrl];
        
        self.photoImage.layer.cornerRadius = self.photoImage.frame.size.width / 2;
        self.photoImage.clipsToBounds = YES;
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.backgroundImage.frame;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.blurView addSubview:blurEffectView];
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
