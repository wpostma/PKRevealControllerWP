//
//  LeftDemoViewController.h
//  PKRevealController
//
//  Created by Philip Kluz on 1/18/13.
//  Copyright (c) 2013 zuui.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftDemoViewController : UIViewController

#pragma mark - Methods

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)showOppositeView:(id)sender;
- (IBAction)togglePresentationMode:(id)sender;

@end