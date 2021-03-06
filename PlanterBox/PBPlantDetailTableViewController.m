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
#import "PBPlantEntryEditViewController.h"

@interface PBPlantDetailTableViewController ()

@end

@implementation PBPlantDetailTableViewController

@synthesize plant;
@synthesize dateFormatter;

- (void)setPlant:(PBPlant *)newPlant
{
    if (newPlant != plant){
        plant = newPlant;
        self.title = plant.name;
    }
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 44;
    if (indexPath.row == 0) {
        height = 160;
    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MainCellIdentifier = @"MainEntryCell";    
    static NSString *CellIdentifier = @"EntryCell";
    PBPlantEntry* entry = [self.plant.entries objectAtIndex:indexPath.row];    
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:MainCellIdentifier];
        UIImageView* imageView = (UIImageView*)[cell viewWithTag:102];
        UILabel* dateLabel = (UILabel*)[cell viewWithTag:103];        
        imageView.image = entry.image;
        dateLabel.text = [self.dateFormatter stringFromDate:entry.date];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.textLabel.text = [dateFormatter stringFromDate:entry.date];
        cell.imageView.image = entry.image;
        cell.detailTextLabel.text = entry.notes;
    }    
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

- (void)plantEntryEditViewControllerDidCancel:(PBPlantEntryEditViewController *)plantEntryEditViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)plantEntryEditViewControllerDidSave:(PBPlantEntryEditViewController *)plantEntryEditViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([@"presentPlantEntryDetail" isEqualToString:segue.identifier]){
        NSIndexPath* index = [self.tableView indexPathForCell:sender];
        PBPlantEntry* entry = [self.plant.entries objectAtIndex:index.row];
        PBPlantEntryViewController* entryViewController = segue.destinationViewController;
        entryViewController.plantEntry = entry;
        entryViewController.dateFormatter = self.dateFormatter;
    } else if ([@"presentEditView" isEqualToString:segue.identifier]) {
        UINavigationController* navController = segue.destinationViewController;
        PBPlantEntryEditViewController* editViewController = [navController.viewControllers objectAtIndex:0];
        editViewController.delegate = self;
        editViewController.dateFormatter = self.dateFormatter;
    }
}

@end
