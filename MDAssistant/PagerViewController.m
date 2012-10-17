//
//  PagerViewController.m
//  MDAssistant
//
//  Created by Leo on 9/29/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "PagerViewController.h"
#import "ORController.h"

@interface PagerViewController ()

@end

@implementation PagerViewController {
    NSArray *options;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    options = [NSArray arrayWithObjects:@"Cross Cover", @"Signout to OR",  @"Sign back to on page",  @"Refer to Cell Phone", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPagerViewController:nil];
    [super viewDidUnload];
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
    if ([tableID isEqualToString:@"Signout to OR"]) {
        simpleTableIdentifier = @"CCcell";
    }
    else{
      simpleTableIdentifier = @"RCcell";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
