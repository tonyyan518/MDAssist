//
//  CallController.h
//  MDAssistant
//
//  Created by Tony Yan
//

#import <UIKit/UIKit.h>

@interface CallController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic, strong) NSMutableArray *callText;
@property (nonatomic, strong) NSMutableArray *callNums;
- (IBAction)callPhone:(id)sender;

@end
