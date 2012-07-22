//
//  PBPlantEntryEditViewController.m
//  PlanterBox
//
//  Created by Ashley Shimabuku on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBPlantEntryEditViewController.h"
#import "PBPlantEntry.h"
#import "PBPlant.h"

@interface PBPlantEntryEditViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *plantImageView;
@property (weak, nonatomic) IBOutlet UITextField *plantNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *entryDateButton;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
- (IBAction)showImagePicker:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end

@implementation PBPlantEntryEditViewController
@synthesize plantImageView;
@synthesize plantNameTextField;
@synthesize entryDateButton;
@synthesize notesTextView;

@synthesize delegate;
@synthesize plantEntry;
@synthesize dateFormatter;

-(void)setPlantEntry:(PBPlantEntry *)newPlantEntry
{
    if (plantEntry != newPlantEntry) {
        plantEntry = newPlantEntry;
        if (plantEntry) {
            self.title = [NSString stringWithFormat:@"Edit %@", plantEntry.plant.name];
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setPlantImageView:nil];
    [self setPlantNameTextField:nil];
    [self setEntryDateButton:nil];
    [self setNotesTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.plantEntry) {
        NSString *dateString = [self.dateFormatter stringFromDate:self.plantEntry.date];
        [self.entryDateButton setTitle:dateString forState:UIControlStateNormal];
        self.plantNameTextField.text = self.plantEntry.plant.name;
        self.plantImageView.image = self.plantEntry.image;
        self.notesTextView.text = self.plantEntry.notes;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cancel:(id)sender
{
    [self.delegate plantEntryEditViewControllerDidCancel:self];
}

- (IBAction)save:(id)sender
{
    [self.delegate plantEntryEditViewControllerDidSave:self];
}
- (IBAction)showImagePicker:(id)sender {
}
@end
