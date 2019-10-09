//
//  CMAEntryController.h
//  JournalObjC
//
//  Created by Christopher Alegre on 10/7/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"
#import <UIKit/UIKit.h>

@interface CMAEntryController : NSObject

+ (CMAEntryController *)sharedController;
@property(nonatomic,strong) NSArray * entries;
-(void)addEntriesObject:(CMAEntry *)entry;
-(void)removeEntriesObject:(CMAEntry *)entry;

- (void)saveToPersistentStorage;
@end

