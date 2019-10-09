//
//  CMAEntryDetailViewController.m
//  JournalObjC
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMAEntryDetailViewController.h"
#import "CMAEntryController.h"

@interface CMAEntryDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *entryTextView;

@end

@implementation CMAEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.entryTextView.text = self.entry.bodyText;
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        self.entry.title = self.titleTextField.text;
        self.entry.bodyText = self.entryTextView.text;
        self.entry.timeStamp = [NSDate date];
        [[CMAEntryController sharedController] saveToPersistentStorage];
    } else {
        CMAEntry * entry = [[CMAEntry alloc]initWithTitle:self.titleTextField.text text:self.entryTextView.text timeStamp:[NSDate date]];
        [[CMAEntryController sharedController] addEntriesObject:entry];
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (IBAction)clearButtonTapped:(id)sender {
    
    self.titleTextField.text = @"";
    self.entryTextView.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)setEntry:(CMAEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}

@end
