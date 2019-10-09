//
//  CMAEntryDetailViewController.h
//  JournalObjC
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMAEntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMAEntryDetailViewController : UIViewController

@property (nonatomic, strong) CMAEntry * entry;

@end

NS_ASSUME_NONNULL_END
