//
//  GHMMenuControlViewController.h
//  gohotmart
//
//  Created by Roberth Siqueira on 05/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMSlideMenu/UIViewController+AMSlideMenu.h>

@interface GHMMenuControlViewController : UIViewController
@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) AMSlideMenuMainViewController *mainVC;

- (void)openContentNavigationController:(UINavigationController *)nvc;
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
