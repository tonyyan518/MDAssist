//
//  CallController.m
//  MDAssistant
//
//  Created by guest user on 10/9/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "ORController.h"

@interface ORController ()

@end

@implementation ORController
@synthesize message, rowNumber;

    NSArray * options;

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
    options = [NSArray arrayWithObjects:@"OR 1", @"OR 2",  @"OR 3", @"OR 4", @"OR 5", @"OR 6", @"OR 7", @"OR 8", @"OR 9", @"OR 10", @"OR 11", @"OR 12", @"OR 13", @"OR 14", @"OR 15", @"OR 16", @"OR 17",@"L&D OR 1",@"L&D OR 2", nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
