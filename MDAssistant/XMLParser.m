//
//  XMLParser.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "XMLParser.h"
#import "Entry.h"

@implementation XMLParser
@synthesize entry, entries;

- (XMLParser *) initXMLParser {
    //initialize with an array of all the parsed entries
    entries = [[NSMutableArray alloc] init];
    return [super init];
}

//whenever the parser comes across an "entry", initialize a new 'Entry'
//otherwise, clear the currentElementValue
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    if([elementName isEqualToString:@"entry"]) {
        entry = [[Entry alloc] init];
    }
    else
        currentElementValue = nil;
}

//populate currentElementValue with the value of the current element
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if(!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else {
        [currentElementValue appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    //end of the file
    if([elementName isEqualToString:@"entries"])
        return;
    //end of an entry, so add it to the array of all entries
    if([elementName isEqualToString:@"entry"]) {
        [entries addObject:entry];
        entry = nil;
    }
    //a part of an entry; add it to the entry
    else {
        [entry setValue:currentElementValue forKey:elementName];
    }
    //clear the currentElementValue
    currentElementValue = nil;
}

@end
