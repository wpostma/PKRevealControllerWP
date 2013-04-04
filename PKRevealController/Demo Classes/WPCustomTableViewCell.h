//
//  WPCustomTableViewCell.h
//  TabBarPlusNavPlay
//
//  Created by Warren Postma on 2013-04-01.
//  Copyright (c) 2013 Warren Postma. All rights reserved.
//
// Has associated WPCustomTableViewCell_iPhone.xib
// in future should have an _iPad.xib too.

#import <UIKit/UIKit.h>

@interface WPCustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageLeft;
@property (strong, nonatomic) IBOutlet UIImageView *imageRight;
@property (strong, nonatomic) IBOutlet UILabel *labelLine1;
@property (strong, nonatomic) IBOutlet UILabel *labelLine2;
@property (strong, nonatomic) IBOutlet UITextField *quantityInputField;

@end
