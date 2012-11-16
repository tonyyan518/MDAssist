//
//  ORController.m
//  MDAssistant
//
//  Created by guest user on 10/18/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "ORController.h"
#import "CallController.h"

#define CALL_SEGUE @"callSegue"

@interface ORController ()

@end

@implementation ORController {
    NSArray *options;
    NSArray *ORnumbers;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CallController *dest = segue.destinationViewController;
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uniqueID = [defaults objectForKey:@"savedID"];
    NSString *pagerNum = [defaults objectForKey:@"savedPager"];
    NSString *ORnum = [ORnumbers objectAtIndex:path.row];
    NSString *num = [NSString stringWithFormat:@"%@,,*#,%@,18,%@#", pagerNum, uniqueID, ORnum];
    NSString *name = [NSString stringWithFormat:@"Signout to: %@",[options objectAtIndex:path.row]];
    NSMutableArray *callNums = [NSMutableArray arrayWithObject:num];
    NSMutableArray *callText = [NSMutableArray arrayWithObject:name];
    dest.callNums = callNums;
    dest.callText = callText;
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
    options = [NSArray arrayWithObjects:@"OR1", @"OR2",  @"OR3",  @"OR4", @"OR5", @"OR6", @"OR7", @"OR8",@"OR9", @"OR11", @"OR12", @"OR14", @"OR15", @"OR16", @"OR17", nil];
    ORnumbers = [NSArray arrayWithObjects:@"6810101", @"6810102", @"6810103", @"6810104", @"6810105", @"6810106",@"6810107",@"6810108",@"6810109",@"6810111",@"6810112",@"6810114",@"6810115",@"6810116",@"6810117", nil];
    
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
    return [options count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier;
    
    simpleTableIdentifier = @"ORcell";
    
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
    
    NSString *ORnum = [ORnumbers objectAtIndex:indexPath.row];
    NSString *callNum = [NSString stringWithFormat:@"%@,,*#,%@,18,%@#", pagerNum, uniqueID, ORnum];
    
}

@end
