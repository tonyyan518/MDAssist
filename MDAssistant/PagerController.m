//
//  PagerController.m
//  MDAssistant
//
//  Created by Tony Yan, Leo Rofe
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
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    options = [NSArray arrayWithObjects:@"Cross Cover", @"Sign Out to OR", @"On Page", @"Not On Page", @"Refer to Cell Phone", @"Status: Emergency Only", nil];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uniqueID = [defaults objectForKey:@"savedID"];
    NSString *pagerNum = [defaults objectForKey:@"savedPager"];
    NSString *cellNum = [defaults objectForKey:@"savedCell"];
    NSString *tableID = [options objectAtIndex:indexPath.row];
    if ([tableID isEqualToString:@"On Page"]) {
        NSString *num = [NSString stringWithFormat:@"%@,*,%@#,12", pagerNum, uniqueID];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
    }
    else if ([tableID isEqualToString:@"Refer to Cell Phone"]) {
        NSString *num = [NSString stringWithFormat:@"%@,*,%@#,17,%@#", pagerNum, uniqueID, cellNum];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
    }
    else if ([tableID isEqualToString:@"Not On Page"]) {
        NSString *num = [NSString stringWithFormat:@"%@,*,%@#,13", pagerNum, uniqueID];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
    }
    else if ([tableID isEqualToString:@"Status: Emergency Only"]) {
        NSString *num = [NSString stringWithFormat:@"%@,*,%@#,16", pagerNum, uniqueID];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", num];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
    }
} 

@end
