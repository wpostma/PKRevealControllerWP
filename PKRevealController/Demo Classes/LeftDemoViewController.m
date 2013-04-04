//
//  LeftDemoViewController.m
//  PKRevealController
//
//  Created by Philip Kluz on 1/18/13.
//  Copyright (c) 2013 zuui.org. All rights reserved.
//

#import "LeftDemoViewController.h"
#import "PKRevealController.h"
#import "WPCustomTableViewCell.h"

@implementation LeftDemoViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Each view can dynamically specify the min/max width that can be revealed.
    [self.revealController setMinimumWidth:280.0f maximumWidth:324.0f forViewController:self];
}

#pragma mark - API

- (IBAction)showOppositeView:(id)sender
{
    [self.revealController showViewController:self.revealController.rightViewController];
}

- (IBAction)togglePresentationMode:(id)sender
{
    if (![self.revealController isPresentationModeActive])
    {
        [self.revealController enterPresentationModeAnimated:YES
                                                  completion:NULL];
    }
    else
    {
        [self.revealController resignPresentationModeEntirely:NO
                                                     animated:YES
                                                   completion:NULL];
    }
}

#pragma mark - Autorotation

/*
* Please get familiar with iOS 6 new rotation handling as if you were to nest this controller within a UINavigationController,
* the UINavigationController would _NOT_ relay rotation requests to his children on its own!
*/

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

#pragma mark table view


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"User tapped row");
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)atableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    // Usually the number of items in your array (the one that holds your list)
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Where we configure the cell in each row
    
    static NSString *CellIdentifier = @"WPCustomTableViewCellIdentifier";
    //UITableViewCell *cell;
    WPCustomTableViewCell *cell;
    
    cell = [atableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib =  [[NSBundle mainBundle] loadNibNamed:@"WPCustomTableViewCell_iPhone" owner:self options: nil];
        
        cell = [nib objectAtIndex:0];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray; // better looking selection color than blue!
    
    cell.labelLine1.Text = [NSString stringWithFormat:@"Some Long Piece of Text. Testing %d",indexPath.row];
    
    if (indexPath.row==0) {
        [cell.imageRight setHidden:TRUE];
        [cell.quantityInputField setHidden:FALSE];
        cell.labelLine2.Text = @"Demo with editing";
    }
    else {
        [cell.imageRight setHidden:FALSE];
        [cell.quantityInputField setHidden:TRUE];
        cell.labelLine2.Text = @"Demo with second image";
        
    }
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


// Override to support editing the table view.
- (void)tableView:(UITableView *)atableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    [_tableView beginUpdates];
    
    
    /*
     if (editingStyle == UITableViewCellEditingStyleDelete) {
     // Delete the row from the data source
     //
     
     if (barcodeitems) {
     int idx = indexPath.row;
     if ((idx>=0)&&(idx<=([barcodeitems count]-1))) {
     [barcodeitems removeObjectAtIndex:idx];
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     }
     }
     }
     else if (editingStyle == UITableViewCellEditingStyleInsert) {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     */
    
    [_tableView endUpdates];
    [_tableView reloadData];
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end