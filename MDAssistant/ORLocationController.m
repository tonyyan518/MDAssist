//
//  ORLocationController.m
//  MDAssistant
//
//  Created by Tony Yan, Leo Rofe
//

#import "ORLocationController.h"
#import "ORController.h"
#import "XMLParser.h"
#import "Entry.h"

@interface ORLocationController ()

@end

@implementation ORLocationController {
    NSMutableArray *options;
    NSMutableArray *selection;
    NSMutableArray *selectionNum;
    NSMutableArray *dukeNorth;
    NSMutableArray *dukeNorthNum;
    NSMutableArray *dukeLabor;
    NSMutableArray *dukeLaborNum;
    NSMutableArray *durhamRegion;
    NSMutableArray *durhamRegionNum;
    NSMutableArray *ASCRegion;
    NSMutableArray *ASCRegionNum;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Populate the next screen depending on which OR Category was chosen
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSString *tableID = [options objectAtIndex:path.row];
    if ([tableID isEqualToString:@"Duke North"]) {
        selection = dukeNorth;
        selectionNum = dukeNorthNum;
    }
    else if ([tableID isEqualToString:@"Durham Regional"]) {
        selection = durhamRegion;
        selectionNum = durhamRegionNum;
    }
    else if ([tableID isEqualToString:@"ASC"]){
        selection = ASCRegion;
        selectionNum = ASCRegionNum;
    }
    else{
        selection = dukeLabor;
        selectionNum = dukeLaborNum;
    }
    ORController *dest = segue.destinationViewController;
    dest.optionText = selection;
    dest.optionNum = selectionNum;
    dest.titleBar.title = tableID;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    options = [NSArray arrayWithObjects:@"Duke North", @"Duke Labor & Delivery", @"Durham Regional", @"ASC", nil];
    
    //initialize the arrays
    dukeNorth = [[NSMutableArray alloc] init];
    dukeNorthNum = [[NSMutableArray alloc] init];
    dukeLabor = [[NSMutableArray alloc] init];
    dukeLaborNum = [[NSMutableArray alloc] init];
    durhamRegion = [[NSMutableArray alloc] init];
    durhamRegionNum = [[NSMutableArray alloc] init];
    ASCRegion = [[NSMutableArray alloc] init];
    ASCRegionNum = [[NSMutableArray alloc] init];
    
    //parse the Duke North ORs
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DukeNorthORs" ofType:@"xml"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    BOOL success = [xmlParser parse];
    if(success) {
        NSMutableArray *entries = [parser entries];
        for (Entry *e in entries) {
            [dukeNorth addObject:e.name];
            [dukeNorthNum addObject:e.number];
        }
    }
    //parse the Duke Labor ORs
    path = [[NSBundle mainBundle] pathForResource:@"DukeLaborORs" ofType:@"xml"];
    url = [NSURL fileURLWithPath:path];
    xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    parser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    success = [xmlParser parse];
    if(success) {
        NSMutableArray *entries = [parser entries];
        for (Entry *e in entries) {
            [dukeLabor addObject:e.name];
            [dukeLaborNum addObject:e.number];
        }
    }
    //parse the Durham Regional ORs
    path = [[NSBundle mainBundle] pathForResource:@"DurhamRegionalORs" ofType:@"xml"];
    url = [NSURL fileURLWithPath:path];
    xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    parser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    success = [xmlParser parse];
    if(success) {
        NSMutableArray *entries = [parser entries];
        for (Entry *e in entries) {
            [durhamRegion addObject:e.name];
            [durhamRegionNum addObject:e.number];
        }
    }
    //parse the ASC ORs
    path = [[NSBundle mainBundle] pathForResource:@"ASCORs" ofType:@"xml"];
    url = [NSURL fileURLWithPath:path];
    xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    parser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    success = [xmlParser parse];
    if(success) {
        NSMutableArray *entries = [parser entries];
        for (Entry *e in entries) {
            [ASCRegion addObject:e.name];
            [ASCRegionNum addObject:e.number];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    simpleTableIdentifier = @"locCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    return cell;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
