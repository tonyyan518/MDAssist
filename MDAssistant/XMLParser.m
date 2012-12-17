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
    entries = [[NSMutableArray alloc] init];
    return [super init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    if([elementName isEqualToString:@"entry"]) {
        entry = [[Entry alloc] init];
    }
    else
        currentElementValue = nil;
}

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
    
    if([elementName isEqualToString:@"entries"])
        return;
    
    if([elementName isEqualToString:@"entry"]) {
        [entries addObject:entry];
        entry = nil;
    }
    else {
        [entry setValue:currentElementValue forKey:elementName];
    }
    currentElementValue = nil;
}

@end
