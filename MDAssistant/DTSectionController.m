//
//  DTSectionController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "DTSectionController.h"

@interface DTSectionController ()

@end

@implementation DTSectionController {
    NSArray *options;
}
@synthesize titleBar;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //prepare the PDF that is supposed to be displayed
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSString *fileName = [options objectAtIndex:path.row];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fileName forKey:@"fileName"];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    options = _templateOptions;
}

- (void)viewDidUnload
{
    [self setTitleBar:nil];
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
    static NSString *tableID;
    tableID = [options objectAtIndex:indexPath.row];
    
    simpleTableIdentifier = @"templateCell";
    
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
}

@end
