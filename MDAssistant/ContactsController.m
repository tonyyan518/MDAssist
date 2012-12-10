//
//  ContactsController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "ContactsController.h"
#import "CallController.h"

@interface ContactsController ()

@end

@implementation ContactsController {
    NSArray *options;
    NSArray *numbers;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CallController *dest = segue.destinationViewController;
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSString *num = [numbers objectAtIndex:path.row];
    NSString *name = [NSString stringWithFormat:@"Contact: %@",[options objectAtIndex:path.row]];
    NSMutableArray *callNums = [NSMutableArray arrayWithObject:num];
    NSMutableArray *callText = [NSMutableArray arrayWithObject:name];
    dest.callNums = callNums;
    dest.callText = callText;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //hard-coded contacts specific to this version
    options = [NSArray arrayWithObjects:@"Sue Knerr", @"Fidel Valea Cell",  @"Resident Lounge",  @"GME Office", @"Laverne Alston", @"Michael Davidson", @"Mole Phone", @"NICU Fellow", @"Duke Triage Back Line", @"HROB Nurses (MD Line)", @"HROB Clinic Workroom", @"Duke Perinatal Raleigh", @"Ryan Clinic Workroom", @"Gyn Clinic 1J workroom", @"Onc Intern Phone", @"Charlotte Gilbert", @"Ida Mae Fleming", @"DRH Resident Call Room", @"Duke Dictation", @"DRH Dictation", @"Raleigh Dictation", nil];
    numbers = [NSArray arrayWithObjects:@"9196682591", @"9193573264", @"9196136585", @"9196843491", @"9196683948", @"9196135156", @"9196811065", @"18777815126", @"9196815021", @"9196687430", @"9196687428", @"9197834299", @"9196687888", @"9196687416", @"9196811670", @"9196843937", @"9196812182", @"9194704215", @"9196815757", @"18776290808", @"18775901905", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [options count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier;
    simpleTableIdentifier = @"contactCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    return cell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *num = [numbers objectAtIndex:indexPath.row];
    NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
    NSLog(@"%@", callString);
}

@end
