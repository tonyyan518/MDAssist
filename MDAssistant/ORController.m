//
//  ORController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "ORController.h"
#import "CallController.h"

#define CALL_SEGUE @"callSegue"

@interface ORController ()

@end

@implementation ORController

@synthesize titleBar;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setTitleBar:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_optionText count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier;
    
    simpleTableIdentifier = @"ORcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [_optionText objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uniqueID = [defaults objectForKey:@"savedID"];
    NSString *pagerNum = [defaults objectForKey:@"savedPager"];
    NSString *ORnum = [_optionNum objectAtIndex:indexPath.row];
    NSString *callString = [NSString stringWithFormat:@"telprompt:%@,*,%@#,18,%@#", pagerNum, uniqueID, ORnum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
    NSLog(@"%@", callString);
}

@end
