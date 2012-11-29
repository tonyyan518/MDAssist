//
//  ORLocationController.m
//  MDAssistant
//
//  Created by Leo on 11/28/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "ORLocationController.h"
#import "ORController.h"

@interface ORLocationController ()

@end

@implementation ORLocationController {
    NSArray *options;
    NSArray *selection;
    NSArray *selectionNum;
    NSArray *dukeNorth;
    NSArray *dukeNorthNum;
    NSArray *durhamRegion;
    NSArray *durhamRegionNum;
    NSArray *ASCRegion;
    NSArray *ASCRegionNum;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSString *tableID = [options objectAtIndex:path.row];
    if ([tableID isEqualToString:@"Duke North"]) {
        selection = dukeNorth;
        selectionNum = dukeNorthNum;
    }
    else if ([tableID isEqualToString:@"Durham Region"]) {
        selection = durhamRegion;
        selectionNum = durhamRegionNum;
    }
    else {
        selection = ASCRegion;
        selectionNum = ASCRegionNum;
    }
    ORController *dest = segue.destinationViewController;
    dest.optionText = selection;
    dest.optionNum = selectionNum;
    dest.titleBar.title = tableID;
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
    options = [NSArray arrayWithObjects:@"Duke North", @"Durham Region", @"ASC Region", nil];
    dukeNorth = [NSArray arrayWithObjects:@"Duke North OR 1", @"Duke North OR 2",  @"Duke North OR 3",  @"Duke North OR 4", @"Duke North OR 5", @"Duke North OR 6", @"Duke North OR 7", @"Duke North OR 8",@"Duke North OR 9", @"Duke North OR 11", @"Duke North OR 12", @"Duke North OR 14", @"Duke North OR 15", @"Duke North OR 16", @"Duke North OR 17", @"Duke North OR 18", @"Duke North OR 19", @"Duke North OR 20", @"Duke North OR 21", @"Duke North OR 22", @"Duke North OR 23", @"Duke North OR 24", @"Duke North OR 25", @"Duke North OR 26", @"Duke North OR 27", @"Duke North OR 28", @"Duke North OR 29", @"Duke North OR 30", @"Duke North OR 31", @"Duke North OR 32", @"Duke North OR 33", @"Duke North OR 34", @"Duke North OR 35", @"Duke North OR 36", @"Duke North OR 37", @"Pediatric OR 1", @"Pediatric OR 2", @"Obstetric OR", @"Obstetric DR 1", @"Obstetric DR 2", nil];
    dukeNorthNum = [NSArray arrayWithObjects:@"9196810101", @"9196810102", @"9196810103", @"9196810104", @"9196810105", @"9196810106", @"9196810107", @"9196810108", @"9196810109", @"9196810111", @"9196810112", @"9196810114", @"9196810115", @"9196810116", @"9196810117", @"9196810118", @"9196810119", @"9196810120", @"9196810121", @"9196810122", @"9196810123", @"9196810124", @"9196810125", @"9196810126", @"9196810127", @"9196810128", @"9196810129", @"9196810130", @"9196810131", @"9196810132", @"9196600133", @"9196601134", @"9196600135", @"9196600136", @"9196600137", @"9196817396", @"9196817399", @"9196815670", @"9196815656", @"9196816488", nil];
    durhamRegion = [NSArray arrayWithObjects:@"Durham Region OR 1", @"Durham Region OR 2", @"Durham Region OR 3", @"Durham Region OR 4", @"Durham Region OR 5", @"Durham Region OR 6", @"Durham Region OR 7", @"Durham Region OR 8", @"Durham Region OR 9", @"Durham Region OR 10", @"Durham Region OR 11", @"Durham Region OR 12", @"Durham Region OR 14", @"Durham Region OR 15", @"Durham Region OR 16", @"Durham Region OR 17", nil];
    durhamRegionNum = [NSArray arrayWithObjects:@"9194708351", @"9194708352", @"9194708353", @"9194708354", @"9194708355", @"9194708356", @"9194708357", @"9194708358", @"9194708359", @"9194708360", @"9194708361", @"9194708350", @"9194708352", @"9194708354", @"9194708357", @"9194708358", nil];
    ASCRegion = [NSArray arrayWithObjects:@"ASC Region OR 1", @"ASC Region OR 2", @"ASC Region OR 3", @"ASC Region OR 4", @"ASC Region OR 5", @"ASC Region OR 6", @"ASC Region OR 7", @"ASC Region OR 8", @"ASC Region OR 9", nil];
    ASCRegionNum = [NSArray arrayWithObjects:@"9196682301", @"9196682302", @"9196682303", @"9196682304", @"9196682305", @"9196682306", @"9196682307", @"9196682308", @"9196682033", nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    simpleTableIdentifier = @"locCell";
    
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
}

@end
