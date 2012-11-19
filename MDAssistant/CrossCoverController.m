//
//  CrossCoverController.m
//  MDAssistant
//
//  Created by guest user on 10/18/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "CrossCoverController.h"
#import "CallController.h"

#define CALL_SEGUE @"callSegue"

@interface CrossCoverController ()
@property (nonatomic, strong) NSMutableArray *selectedIndexPaths;
@end

@implementation CrossCoverController {
    NSArray *options;
    NSArray *CCnumbers;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CallController *dest = segue.destinationViewController;
    NSMutableArray *callNums = [[NSMutableArray alloc] init];
    NSMutableArray *callTexts = [[NSMutableArray alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *pagerNum = [defaults objectForKey:@"savedPager"];
    for(NSIndexPath *index in _selectedIndexPaths) {
        NSString *CCnum = [CCnumbers objectAtIndex:index.row];
        NSString *num = [NSString stringWithFormat:@"919970%@,,*#,151,%@", CCnum, pagerNum];
        [callNums addObject:num];
        NSString *CCtext = [options objectAtIndex: index.row];
        NSString *text = [NSString stringWithFormat:@"Cross Cover: %@", CCtext];
        [callTexts addObject:text];
    }
    dest.callNums = callNums;
    dest.callText = callTexts;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)callButtonPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:CALL_SEGUE sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    options = [NSArray arrayWithObjects:@"GYN-ONCOLOGY", @"BENIGN GYN",  @"OB/GYN CONSULTS",  @"UROGYNECOLOGY", @"OB ANTEPARTUM", @"REI",nil];
    CCnumbers = [NSArray arrayWithObjects:@"7700", @"4962",  @"7066",  @"9976", @"2233", @"9285", nil];
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    [self.tableView setEditing:YES];
    self.selectedIndexPaths = [[NSMutableArray alloc] init];
    
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
    
    simpleTableIdentifier = @"CCcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped:)];
    [cell addGestureRecognizer:tap];
    
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    cell.userInteractionEnabled = YES;
    return cell;
}

- (void) cellTapped: (UITapGestureRecognizer *) recognizer
{
    UITableViewCell *cellTapped = (UITableViewCell *) recognizer.view;
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForCell:cellTapped];
    if([self.selectedIndexPaths containsObject:selectedIndexPath])
    {
        [self.selectedIndexPaths removeObject:selectedIndexPath];
        [self.tableView deselectRowAtIndexPath:selectedIndexPath animated:NO];
    }
    else
    {
        [self.selectedIndexPaths addObject:selectedIndexPath];
        [self.tableView selectRowAtIndexPath:selectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
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
    NSString *pagerNum = [defaults objectForKey:@"savedPager"];
    
    NSString *CCnum = [CCnumbers objectAtIndex:indexPath.row];
    NSString *callNum = [NSString stringWithFormat:@"919970%@,,*#,151,%@", CCnum, pagerNum];
    NSString *CCtext = [options objectAtIndex:indexPath.row];
    NSString *callText = [NSString stringWithFormat:@"Cross Cover: %@", CCtext];
    
    [defaults setObject:callNum forKey:@"callNum"];
    [defaults setObject:callText forKey:@"callText"];
    [defaults synchronize];
}

@end
