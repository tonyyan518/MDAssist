//
//  DictationTemplatesController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "DictationTemplatesController.h"
#import "DTSectionController.h"

@interface DictationTemplatesController ()

@end

@implementation DictationTemplatesController {
    NSArray *options;
    NSArray *selection;
    NSArray *obstetrics;
    NSArray *gynecology;
    NSArray *urogynecology;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSString *tableID = [options objectAtIndex:path.row];
    if ([tableID isEqualToString:@"Obstetrics"]) {
        selection = obstetrics;
    }
    else if ([tableID isEqualToString:@"Gynecology"]) {
        selection = gynecology;
    }
    else {
        selection = urogynecology;
    }
    DTSectionController *dest = segue.destinationViewController;
    dest.templateOptions = selection;
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
    //more hard-coded info that should come from a server
    options = [NSArray arrayWithObjects:@"Obstetrics", @"Gynecology", @"UroGynecology", nil];
    obstetrics = [NSArray arrayWithObjects:@"Dilation and Evacuation", @"Post Partum BTL", @"McDonald Cerclage", @"Cesarean Section", nil];
    gynecology = [NSArray arrayWithObjects:@"LEEP", @"Cold Knife Conization", @"Essure", @"Hydrothermal Ablation", @"Hysteroscopy Dilation and Curettage", @"Suction Dilation and Curettage", @"Laparoscopic BTL", @"TAH and TAH|BSO", @"Total Vaginal Hysterectomy", @"Total Laparoscopic Hysterectomy", @"Diagnostic Laparoscopy for Ectopic Pregnancy", @"Abdominal Myomectomy", @"Discharge Summary", @"Partial Vulvectomy", @"Cold Knife Cone and Skinning Vulvectomy", @"Sentinel Node Dissection", @"Robotic Assisted TLH|BSO", @"BETA BOOK CONSULTATON REPORT", nil];
    urogynecology = [NSArray arrayWithObjects:@"Anterior and Posterior Colporrhaphy", @"Anterior Colporrhaphy and Midurethral Sling", @"Anterior colporrhaphy and Cystourethroscopy", @"Anterior colporrhaphy midurethral sling with Bard ALIGN and cystourethroscopy", @"Bard Align midurethral mesh sling and cystourethroscopy", nil];
}

- (void)viewDidUnload
{
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
    return [options count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier;
    simpleTableIdentifier = @"sectionCell";
    
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
