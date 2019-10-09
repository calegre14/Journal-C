//
//  Entry.m
//  JournalObjC
//
//  Created by Christopher Alegre on 10/7/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "Entry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimeStampKey = @"timestamp";

@implementation CMAEntry


- (instancetype)initWithTitle:(NSString *)title text:(NSString *)bodyText timeStamp:(NSDate *)timeStamp{
    self = [super init];
    if (self)
    {
        _title = title;
        _bodyText = bodyText;
        _timeStamp = timeStamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *text = dictionary[TextKey];
    NSDate *timestamp = dictionary[TimeStampKey];
    return [self initWithTitle:title text:text timeStamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title, TextKey: self.bodyText, TimeStampKey: self.timeStamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass: [CMAEntry class]]) { return NO; }
    return [[self dictionaryRepresentation] isEqualToDictionary:[(CMAEntry *)object dictionaryRepresentation]];
}

@end
