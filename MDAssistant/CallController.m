//
//  CallController.m
//  MDAssistant
//
//  Created by guest user on 10/17/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "CallController.h"

@interface CallController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) int callCounter;
@property (weak, nonatomic) IBOutlet UIButton *callButton;

@end

@implementation CallController
@synthesize callButton;
@synthesize myTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    self.callCounter = 0;
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setMyTable:nil];
    [self setCallButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}   

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_callText count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier;
    
    simpleTableIdentifier = @"callCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [_callText objectAtIndex:indexPath.row];
    if (indexPath.row == self.callCounter)
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    else
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    cell.userInteractionEnabled = YES;
    if (indexPath.row < self.callCounter)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)callPhone:(id)sender {
    if (self.callCounter >= self.callText.count) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else {
        NSString *loadString = [_callNums objectAtIndex:self.callCounter];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", loadString];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        self.callCounter++;
        [self.myTable reloadData];
        NSLog(@"%@",callString);
        if(self.callCounter >= self.callText.count)
        {
            [self.callButton setTitle:@"DONE" forState:UIControlStateNormal];
        }
    }
}

@end
