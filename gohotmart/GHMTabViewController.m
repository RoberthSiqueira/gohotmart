//
//  GHMTabViewController.m
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMTabViewController.h"

@interface GHMTabViewController ()



@end

@implementation GHMTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.layer.borderWidth = 1.0f;
    [self.tabBar.layer setBorderColor:[[UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f]CGColor]];
    
    for(UITabBarItem * tabBarItem in self.tabBar.items){
        tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 70;
    tabFrame.origin.y = self.view.frame.size.height - 70;
    self.tabBar.frame = tabFrame;
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
