//
//  DTSectionController.h
//  MDAssistant
//
//  Created by guest user on 11/13/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTSectionController : UITableViewController

@property (nonatomic, strong) NSArray *templateOptions;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;

@end
