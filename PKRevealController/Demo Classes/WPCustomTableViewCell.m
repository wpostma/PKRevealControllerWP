//
//  WPCustomTableViewCell.m
//  TabBarPlusNavPlay
//
//  Created by Warren Postma on 2013-04-01.
//  Copyright (c) 2013 Warren Postma. All rights reserved.
//
// Has associated WPCustomTableViewCell_iPhone.xib
// in future should have an _iPad.xib too.

#import "WPCustomTableViewCell.h"

@implementation WPCustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
