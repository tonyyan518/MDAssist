//
//  CrossCoverController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "CrossCoverController.h"
#import "CallController.h"
#import "XMLParser.h"
#import "Entry.h"

#define CALL_SEGUE @"callSegue"

@interface CrossCoverController ()
@property (nonatomic, strong) NSMutableArray *selectedIndexPaths;
@end

@implementation CrossCoverController {
    NSMutableArray *options;
    NSMutableArray *CCnumbers;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Prepare the call queue screen based on which locations was selected
    CallController *dest = segue.destinationViewController;
    NSMutableArray *callNums = [[NSMutableArray alloc] init];
    NSMutableArray *callTexts = [[NSMutableArray alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *pagerNum = [[defaults objectForKey:@"savedPager"] substringFromIndex:3];
    for(NSIndexPath *index in _selectedIndexPaths) {
        NSString *CCnum = [CCnumbers objectAtIndex:index.row];
        NSString *num = [NSString stringWithFormat:@"919970%@,,*#,151,%@", CCnum, pagerNum];
        [callNums addObject:num];
        NSString *CCtext = [options objectAtIndex: index.row];
        NSString *text = [NSString stringWithFormat:@"%@", CCtext];
        [callTexts addObject:text];
    }
    dest.callNums = callNums;
    dest.callText = callTexts;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (IBAction)callButtonPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:CALL_SEGUE sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //initiate the arrays
    options = [[NSMutableArray alloc] init];
    CCnumbers = [[NSMutableArray alloc] init];
    
    //parse the locations
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CrossCover" ofType:@"xml"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    BOOL success = [xmlParser parse];
    if(success) {
        NSMutableArray *entries = [parser entries];
        for (Entry *e in entries) {
            [options addObject:e.name];
            [CCnumbers addObject:e.number];
        }
    }
    
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    [self.tableView setEditing:YES];
    self.selectedIndexPaths = [[NSMutableArray alloc] init];
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
    
    simpleTableIdentifier = @"CCcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped:)];
    [cell addGestureRecognizer:tap];
    
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    cell.userInteractionEnabled = YES;
    return cell;
}

- (void) cellTapped: (UITapGestureRecognizer *) recognizer
{
    //toggle between selected and unselected states
    UITableViewCell *cellTapped = (UITableViewCell *) recognizer.view;
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForCell:cellTapped];
    if([self.selectedIndexPaths containsObject:selectedIndexPath])
    {
        [self.selectedIndexPaths removeObject:selectedIndexPath];
        [self.tableView deselectRowAtIndexPath:selectedIndexPath animated:NO];
    }
    else
    {
        [self.selectedIndexPaths addObject:selectedIndexPath];
        [self.tableView selectRowAtIndexPath:selectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
