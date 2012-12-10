//
//  ORLocationController.m
//  MDAssistant
//
//  Created by Tony Yan, Leo Rofe
//

#import "ORLocationController.h"
#import "ORController.h"

@interface ORLocationController ()

@end

@implementation ORLocationController {
    NSArray *options;
    NSArray *selection;
    NSArray *selectionNum;
    NSArray *dukeNorth;
    NSArray *dukeNorthNum;
    NSArray *dukeLabor;
    NSArray *dukeLaborNum;
    NSArray *durhamRegion;
    NSArray *durhamRegionNum;
    NSArray *ASCRegion;
    NSArray *ASCRegionNum;
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
    
    //These are the hard-coded OR locations and numbers in the current version
    //In the future, they should come from a server that the app syncs with regularly
    options = [NSArray arrayWithObjects:@"Duke North", @"Duke Labor & Delivery", @"Durham Regional", @"ASC", nil];
    dukeNorth = [NSArray arrayWithObjects:@"Duke North OR 1", @"Duke North OR 2",  @"Duke North OR 3",  @"Duke North OR 4", @"Duke North OR 5", @"Duke North OR 6", @"Duke North OR 7", @"Duke North OR 8",@"Duke North OR 9", @"Duke North OR 11", @"Duke North OR 12", @"Duke North OR 14", @"Duke North OR 15", @"Duke North OR 16", @"Duke North OR 17", @"Duke North OR 18", @"Duke North OR 19", @"Duke North OR 20", @"Duke North OR 21", @"Duke North OR 22", @"Duke North OR 23", @"Duke North OR 24", @"Duke North OR 25", @"Duke North OR 26", @"Duke North OR 27", @"Duke North OR 28", @"Duke North OR 29", @"Duke North OR 30", @"Duke North OR 31", @"Duke North OR 32", @"Duke North OR 33", @"Duke North OR 34", @"Duke North OR 35", @"Duke North OR 36", @"Duke North OR 37", @"Pediatric OR 1", @"Pediatric OR 2", nil];
    dukeNorthNum = [NSArray arrayWithObjects:@"9196810101", @"9196810102", @"9196810103", @"9196810104", @"9196810105", @"9196810106", @"9196810107", @"9196810108", @"9196810109", @"9196810111", @"9196810112", @"9196810114", @"9196810115", @"9196810116", @"9196810117", @"9196810118", @"9196810119", @"9196810120", @"9196810121", @"9196810122", @"9196810123", @"9196810124", @"9196810125", @"9196810126", @"9196810127", @"9196810128", @"9196810129", @"9196810130", @"9196810131", @"9196810132", @"9196600133", @"9196601134", @"9196600135", @"9196600136", @"9196600137", @"9196817396", @"9196817399", nil];
    dukeLabor = [NSArray arrayWithObjects:@"Obstetric OR", @"Obstetric DR 1", @"Obstetric DR 2", nil];
    dukeLaborNum = [NSArray arrayWithObjects:@"9196815670", @"9196815656", @"9196816488", nil];
    durhamRegion = [NSArray arrayWithObjects:@"Durham Regional OR 1", @"Durham Regional OR 2", @"Durham Regional OR 3", @"Durham Regional OR 4", @"Durham Regional OR 5", @"Durham Regional OR 6", @"Durham Regional OR 7", @"Durham Regional OR 8", @"Durham Regional OR 9", @"Durham Regional OR 10", @"Durham Regional OR 11", @"Durham Regional OR 12", @"Durham Regional OR 14", @"Durham Regional OR 15", @"Durham Regional OR 16", @"Durham Regional OR 17", nil];
    durhamRegionNum = [NSArray arrayWithObjects:@"9194708351", @"9194708352", @"9194708353", @"9194708354", @"9194708355", @"9194708356", @"9194708357", @"9194708358", @"9194708359", @"9194708360", @"9194708361", @"9194708350", @"9194708352", @"9194708354", @"9194708357", @"9194708358", nil];
    ASCRegion = [NSArray arrayWithObjects:@"ASC OR 1", @"ASC OR 2", @"ASC OR 3", @"ASC OR 4", @"ASC OR 5", @"ASC OR 6", @"ASC OR 7", @"ASC OR 8", @"ASC OR 9", nil];
    ASCRegionNum = [NSArray arrayWithObjects:@"9196682301", @"9196682302", @"9196682303", @"9196682304", @"9196682305", @"9196682306", @"9196682307", @"9196682308", @"9196682033", nil];
    
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


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
