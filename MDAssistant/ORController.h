//
//  ORController.h
//  MDAssistant
//
//  Created by Tony Yan
//

#import <UIKit/UIKit.h>

@interface ORController : UITableViewController
@property (nonatomic, strong) NSArray *optionText;
@property (nonatomic, strong) NSArray *optionNum;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;

@end
