//
//  CallController.h
//  MDAssistant
//
//  Created by guest user on 10/17/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic, strong) NSMutableArray *callText;
@property (nonatomic, strong) NSMutableArray *callNums;
- (IBAction)callPhone:(id)sender;

@end
