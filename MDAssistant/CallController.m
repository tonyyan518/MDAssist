//
//  CallController.m
//  MDAssistant
//
//  Created by Tony Yan
//
//  This is the coolest part of the app
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
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setMyTable:nil];
    [self setCallButton:nil];
    [super viewDidUnload];
}   

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
    
    //bold the current call, and unbold the rest
    cell.textLabel.text = [_callText objectAtIndex:indexPath.row];
    if (indexPath.row == self.callCounter)
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    else
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    cell.userInteractionEnabled = YES;
    
    //add a check mark next to the calls that have been made
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
        //make the current call
        NSString *loadString = [_callNums objectAtIndex:self.callCounter];
        NSString *callString = [NSString stringWithFormat:@"telprompt:%@", loadString];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
        NSLog(@"%@", callString);
        self.callCounter++;
        [self.myTable reloadData];
        
        //turn the button into a "Done" button once all the calls have been made
        if(self.callCounter >= self.callText.count)
        {
            [self.callButton setTitle:@"Done" forState:UIControlStateNormal];
        }
    }
}

@end
