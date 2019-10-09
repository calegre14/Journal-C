//
//  CMAEntryController.m
//  JournalObjC
//
//  Created by Christopher Alegre on 10/7/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMAEntryController.h"

static NSString * const EntriesKeys = @"entries";

@implementation CMAEntryController

+ (CMAEntryController *)sharedController {
    static CMAEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CMAEntryController new];
    });
    return sharedInstance;
}
- (void)addEntriesObject:(CMAEntry *)entry
{
    NSMutableArray * newEntries = [self.entries mutableCopy];
    [newEntries addObject:entry];
    self.entries = [newEntries copy];
    [self saveToPersistentStorage];
}
- (void)removeEntriesObject:(CMAEntry *)entry
{
    NSMutableArray * tempArray = [self.entries mutableCopy];
    [tempArray removeObject:entry];
    self.entries = [tempArray copy];
    [self saveToPersistentStorage];

}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _entries = [NSArray new];
        [self loadFromPersistentStorage];
    } return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray * entryDictionaries = [NSMutableArray new];
    
    for (CMAEntry * entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKeys];
}

- (void)loadFromPersistentStorage
{
    NSArray * entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKeys];
    for (NSDictionary * dictionary in entryDictionaries) {
        CMAEntry * entry = [[CMAEntry alloc] initWithDictionary:dictionary];
        [self addEntriesObject:entry];
    }
}

@end
