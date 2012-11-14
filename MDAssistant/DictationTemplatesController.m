//
//  DictationTemplatesController.m
//  MDAssistant
//
//  Created by guest user on 11/13/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "DictationTemplatesController.h"
#import "DTSectionController.h"

@interface DictationTemplatesController ()

@end

@implementation DictationTemplatesController {
    NSArray *options;
    NSArray *selection;
    NSArray *obstetrics;
    NSArray *gynecology;
    NSArray *urogynecology;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSString *tableID = [options objectAtIndex:path.row];
    if ([tableID isEqualToString:@"Obstetrics"]) {
        selection = obstetrics;
    }
    else if ([tableID isEqualToString:@"Gynecology"]) {
        selection = gynecology;
    }
    else {
        selection = urogynecology;
    }
    DTSectionController *dest = segue.destinationViewController;
    dest.templateOptions = selection;
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
    options = [NSArray arrayWithObjects:@"Obstetrics", @"Gynecology", @"UroGynecology", nil];
    obstetrics = [NSArray arrayWithObjects:@"Dilation and Evacuation", @"Post Partum BTL", @"McDonald Cerclage", @"Cesarean Section", nil];
    gynecology = [NSArray arrayWithObjects:@"LEEP", @"Cold Knife Conization", @"Essure", @"Hydrothermal Ablation", @"Hysteroscopy Dilation and Curettage", @"Suction Dilation and Curettage", @"Laparoscopic BTL", @"TAH and TAH/BSO", @"Total Vaginal Hysterectomy", @"Total Laparoscopic Hysterectomy", @"Diagnostic Laparoscopy for Ectopic Pregnancy", @"Abdominal Myomectomy", @"Discharge Summary", @"Partial Vulvectomy", @"Cold Knife Cone and Skinning Vulvectomy", @"Sentinel Node Dissection", @"Robotic Assisted TLH/BSO", @"BETA BOOK CONSULTATON REPORT", nil];
    urogynecology = [NSArray arrayWithObjects:@"Anterior and Posterior Colporrhaphy", @"Anterior Colporrhaphy and Midurethral Sling", @"Anterior colporrhaphy and Cystourethroscopy", @"Anterior colporrhaphy midurethral sling with Bard ALIGN and cystourethroscopy", @"Bard Align midurethral mesh sling and cystourethroscopy", nil];
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
    simpleTableIdentifier = @"sectionCell";
    
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
