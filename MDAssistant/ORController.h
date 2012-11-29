//
//  ORController.h
//  MDAssistant
//
//  Created by guest user on 10/18/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ORController : UITableViewController
@property (nonatomic, strong) NSArray *optionText;
@property (nonatomic, strong) NSArray *optionNum;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;

@end
