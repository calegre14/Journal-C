//
//  Entry.h
//  JournalObjC
//
//  Created by Christopher Alegre on 10/7/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMAEntry : NSObject


- (instancetype)initWithTitle:(NSString *)title text:(NSString *)bodyText timeStamp:(NSDate *)timeStamp;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * bodyText;
@property (nonatomic, strong) NSDate * timeStamp;

@end

