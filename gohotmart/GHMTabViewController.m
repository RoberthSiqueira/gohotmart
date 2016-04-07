//
//  GHMTabViewController.m
//  gohotmart
//
//  Created by Roberth Siqueira on 04/04/16.
//  Copyright © 2016 Roberth. All rights reserved.
//

#import "GHMTabViewController.h"

#define SIZE_OF_LINES 30

@interface GHMTabViewController ()
@property (strong, nonatomic) NSArray<UIView *> *divLines;
@end

@implementation GHMTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [(UITabBarController*)self.navigationController.topViewController setSelectedIndex:2];
    
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(positionDivLines)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:[UIDevice currentDevice]];
    [self setupTabBar];
    [self setupDivLines];
}

-(void)setupTabBar {
    for(UITabBarItem * tabBarItem in self.tabBar.items){
        tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    self.tabBar.layer.borderWidth = 1.0f;
    [self.tabBar.layer setBorderColor:[[UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f]CGColor]];
}

-(void)setupDivLines {
    NSMutableArray *divLinesMutable = [NSMutableArray array];
    
    NSInteger countItens = [self.tabBar.items count];
    
    for (int i = 0; i < (countItens - 1); i++) {
        UIView *line = [[UIView alloc] init];
        [line setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:line];
        [divLinesMutable addObject:line];
    }
    self.divLines = [divLinesMutable copy];
    [self positionDivLines];
}

-(void)positionDivLines {
    NSInteger countItens = [self.tabBar.items count];
    NSInteger sizeScreen = self.view.frame.size.width;
    NSInteger spaceSize = sizeScreen / countItens;
    
    for (int i = 0; i < (countItens - 1); i++) {
        UIView *line = [self.divLines objectAtIndex:i];
        [line setFrame:CGRectMake(spaceSize * (i+1), self.view.frame.size.height - 40, 1, SIZE_OF_LINES)];
        [self.view layoutIfNeeded];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
