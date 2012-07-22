//
//  PBPlantDetailTableViewController.m
//  PlanterBox
//
//  Created by Ashley Shimabuku on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBPlantDetailTableViewController.h"
#import "PBPlant.h"
#import "PBPlantEntry.h"
#import "PBPlantEntryViewController.h"

@interface PBPlantDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *plantImageView;
@property (nonatomic,strong) NSDateFormatter* dateFormatter;

@end

@implementation PBPlantDetailTableViewController

@synthesize plantImageView;
@synthesize plant;
@synthesize dateFormatter;

- (void)setPlant:(PBPlant *)newPlant
{
    if (newPlant != plant){
        plant = newPlant;
        self.title = plant.name;
    }
}

- (NSDateFormatter *)dateFormatter
{
    if (!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.locale = [NSLocale autoupdatingCurrentLocale];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    }
    return dateFormatter;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setPlantImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.plantImageView.image = self.plant.image;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.plant.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EntryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PBPlantEntry* entry = [self.plant.entries objectAtIndex:indexPath.row];

    // Configure the cell...

    cell.textLabel.text = [dateFormatter stringFromDate:entry.date];
    cell.imageView.image = entry.image;
    cell.detailTextLabel.text = entry.notes;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([@"presentPlantEntryDetail" isEqualToString:segue.identifier]){
        NSIndexPath* index = [self.tableView indexPathForCell:sender];
        PBPlantEntry* entry = [self.plant.entries objectAtIndex:index.row];
        PBPlantEntryViewController* entryViewController = segue.destinationViewController;
        entryViewController.plantEntry = entry;
        entryViewController.dateFormatter = self.dateFormatter;
    }
}

@end
