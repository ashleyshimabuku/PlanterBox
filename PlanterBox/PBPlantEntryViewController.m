//
//  PBPlantEntryViewController.m
//  PlanterBox
//
//  Created by Ashley Shimabuku on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBPlantEntryViewController.h"
#import "PBPlantEntry.h"
#import "PBPlant.h"

@interface PBPlantEntryViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *plantImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;

@end

@implementation PBPlantEntryViewController
@synthesize plantImageView;
@synthesize dateLabel;
@synthesize notesTextView;

@synthesize plantEntry;
@synthesize dateFormatter;

-(void)setPlantEntry:(PBPlantEntry *)newPlantEntry
{
    if(plantEntry != newPlantEntry) {
        plantEntry = newPlantEntry;
        self.title = plantEntry.plant.name;
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.plantImageView.image = self.plantEntry.image;
    self.dateLabel.text = [self.dateFormatter stringFromDate:self.plantEntry.date];
    self.notesTextView.text = self.plantEntry.notes;
}

- (void)viewDidUnload
{
    [self setPlantImageView:nil];
    [self setDateLabel:nil];
    [self setNotesTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)plantEntryEditViewControllerDidCancel:(PBPlantEntryEditViewController *)plantEntryEditViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)plantEntryEditViewControllerDidSave:(PBPlantEntryEditViewController *)plantEntryEditViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([@"presentEditView" isEqualToString:segue.identifier]) {
        UINavigationController* navController = segue.destinationViewController;
        PBPlantEntryEditViewController* editViewController = [navController.viewControllers objectAtIndex:0];
        editViewController.plantEntry = self.plantEntry;
        editViewController.delegate = self;
    }
}

@end
