//
//  XMLParser.h
//  MDAssistant
//
//  Created by Tony Yan
//

#import <Foundation/Foundation.h>

@class Entry;

@interface XMLParser : NSObject {
    NSMutableString *currentElementValue;
    Entry *entry;
    NSMutableArray *entries;
}

@property (nonatomic, retain) Entry *entry;
@property (nonatomic, retain) NSMutableArray *entries;

- (XMLParser *) initXMLParser;

@end
