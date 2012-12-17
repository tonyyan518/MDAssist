//
//  ContactsController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "ContactsController.h"
#import "CallController.h"
#import "XMLParser.h"
#import "Entry.h"

@interface ContactsController ()

@end

@implementation ContactsController {
    NSMutableArray *options;
    NSMutableArray *numbers;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //initiate the arrays
    options = [[NSMutableArray alloc] init];
    numbers = [[NSMutableArray alloc] init];
    
    //parse the contacts
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"xml"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    BOOL success = [xmlParser parse];
    if(success) {
        NSMutableArray *entries = [parser entries];
        
        for (Entry *e in entries) {
            [options addObject:e.name];
            [numbers addObject:e.number];
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
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
