//
//  PagerController.m
//  MDAssistant
//
//  Created by guest user on 10/18/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "PagerController.h"
#import "CallController.h"

@interface PagerController ()

@end

@implementation PagerController {
    NSArray *options;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"callSegue"])
    {
        CallController *dest = segue.destinationViewController;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString *uniqueID = [defaults objectForKey:@"savedID"];
        NSString *pagerNum = [defaults objectForKey:@"savedPager"];
        NSString *cellNum = [defaults objectForKey:@"savedCell"];
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        NSString *tableID = [options objectAtIndex:path.row];
        if ([tableID isEqualToString:@"Sign Back to On Page"]) {
            NSString *num = [NSString stringWithFormat:@"%@,,*#,%@,12", pagerNum, uniqueID];
            NSMutableArray *callNums = [NSMutableArray arrayWithObject:num];
            NSString *text = @"Sign Back to On Page";
            NSMutableArray *callText = [NSMutableArray arrayWithObject:text];
            dest.callNums = callNums;
            dest.callText = callText;
        }
        else if ([tableID isEqualToString:@"Refer to Cell Phone"]) {
            NSString *num = [NSString stringWithFormat:@"%@,,*#,%@,17,%@", pagerNum, uniqueID, cellNum];
            NSMutableArray *callNums = [NSMutableArray arrayWithObject:num];
            NSString *text = @"Refer to Cell Phone";
            NSMutableArray *callText = [NSMutableArray arrayWithObject:text];
            dest.callNums = callNums;
            dest.callText = callText;
        }
    }

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    options = [NSArray arrayWithObjects:@"Cross Cover", @"Sign Out to OR", @"On Page", @"Not On Page", @"Refer to Cell Phone", @"Status: Emergency Only", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [options count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier;
    static NSString *tableID;
    tableID = [options objectAtIndex:indexPath.row];
    
    if ([tableID isEqualToString:@"Sign Out to OR"]) {
        simpleTableIdentifier = @"ORcell";
    }
    else if ([tableID isEqualToString:@"Cross Cover"]) {
        simpleTableIdentifier = @"CCcell";
    }
    else {
        simpleTableIdentifier = @"RCcell";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uniqueID = [defaults objectForKey:@"savedID"];
    NSString *pagerNum = [defaults objectForKey:@"savedPager"];
    NSString *cellNum = [defaults objectForKey:@"savedCell"];
    NSString *tableID = [options objectAtIndex:indexPath.row];
    if ([tableID isEqualToString:@"On Page"]) {
        NSString *num = [NSString stringWithFormat:@"%@,,*#,%@,12", pagerNum, uniqueID];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
    }
    else if ([tableID isEqualToString:@"Refer to Cell Phone"]) {
        NSString *num = [NSString stringWithFormat:@"%@,,*#,%@,17,%@", pagerNum, uniqueID, cellNum];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
    }
    else if ([tableID isEqualToString:@"Not On Page"]) {
        NSString *num = [NSString stringWithFormat:@"%@,,*#,%@,13", pagerNum, uniqueID];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
    }
    else if ([tableID isEqualToString:@"Status: Emergency Only"]) {
        NSString *num = [NSString stringWithFormat:@"%@,,*#,%@,16", pagerNum, uniqueID];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
    }
} 

@end
