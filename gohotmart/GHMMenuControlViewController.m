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
#import "GHMTabBar.h"
#import "GHMTabViewController.h"

@interface GHMMenuControlViewController ()

@end

@implementation GHMMenuControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
}
- (IBAction)openSales:(UITapGestureRecognizer *)sender {
    GHMTabBar *tabBar = [[GHMTabBar alloc] init];
    GHMTabViewController *tabView = [[GHMTabViewController alloc]init];
    [tabView setTabBarItem:[tabBar.items objectAtIndex:1]];
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

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
