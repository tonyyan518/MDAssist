//
//  Entry.h
//  MDAssistant
//
//  Tony Yan
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject {
    NSString *name;
    NSString *number;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *number;

@end
