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
    options = [NSArray arrayWithObjects:@"Duke North OR 1", @"Duke North OR 2",  @"Duke North OR 3",  @"Duke North OR 4", @"Duke North OR 5", @"Duke North OR 6", @"Duke North OR 7", @"Duke North OR 8",@"Duke North OR 9", @"Duke North OR 11", @"Duke North OR 12", @"Duke North OR 14", @"Duke North OR 15", @"Duke North OR 16", @"Duke North OR 17", @"Duke North OR 18", @"Duke North OR 19", @"Duke North OR 20", @"Duke North OR 21", @"Duke North OR 22", @"Duke North OR 23", @"Duke North OR 24", @"Duke North OR 25", @"Duke North OR 26", @"Duke North OR 27", @"Duke North OR 28", @"Duke North OR 29", @"Duke North OR 30", @"Duke North OR 31", @"Duke North OR 32", @"Duke North OR 33", @"Duke North OR 34", @"Duke North OR 35", @"Duke North OR 36", @"Duke North OR 37", @"Pediatric OR 1", @"Pediatric OR 2", @"Obstetric OR", @"Obstetric DR 1", @"Obstetric DR 2", @"Durham Region OR 1", @"Durham Region OR 2", @"Durham Region OR 3", @"Durham Region OR 4", @"Durham Region OR 5", @"Durham Region OR 3", @"Durham Region OR 3", @"Durham Region OR 4", @"Durham Region OR 5", @"Durham Region OR 6", @"Durham Region OR 7", @"Durham Region OR 8", @"Durham Region OR 9", @"Durham Region OR 10", @"Durham Region OR 11", @"Durham Region OR 12", @"Durham Region OR 13", @"Durham Region OR 14", @"Durham Region OR 15", @"Durham Region OR 16", @"Durham Region OR 17", @"ASC Region OR 1", @"ASC Region OR 2", @"ASC Region OR 3", @"ASC Region OR 4", @"ASC Region OR 5", @"ASC Region OR 6", @"ASC Region OR 7", @"ASC Region OR 8", @"ASC Region OR 9", nil];
    ORnumbers = [NSArray arrayWithObjects:@"6810101", @"6810102", @"6810103", @"6810104", @"6810105", @"6810106", @"6810107", @"6810108", @"6810109", @"6810111", @"6810112", @"6810114", @"6810115", @"6810116", @"6810117", @"6810118", @"6810119", @"6810120", @"6810121", nil];
    
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
    NSString *callString = [NSString stringWithFormat:@"telprompt:%@,,*#,%@,18,%@#", pagerNum, uniqueID, ORnum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
    NSLog(@"%@", callString);
}

@end
