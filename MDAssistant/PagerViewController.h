//
//  PagerViewController.h
//  MDAssistant
//
//  Created by Leo on 9/29/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CallController;

@interface PagerViewController : UIViewController 
@property (strong, nonatomic) IBOutlet UIView *PagerViewController;
@property (nonatomic, retain) CallController *caller;

@end
