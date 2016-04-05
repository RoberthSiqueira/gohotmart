//
//  GHMMenuViewController.m
//  gohotmart
//
//  Created by Roberth Siqueira on 05/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMMenuViewController.h"

@interface GHMMenuViewController ()

@end

@implementation GHMMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath {
    return @"menuForHome";
}

- (CGFloat)leftMenuWidth {
    return self.view.frame.size.width - 40;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
