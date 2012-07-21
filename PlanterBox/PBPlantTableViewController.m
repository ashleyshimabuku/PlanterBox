//
//  PBPlantTableViewController.m
//  PlanterBox
//
//  Created by Ashley Shimabuku on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBPlantTableViewController.h"
#import "PBPlantDetailTableViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PBPlant.h"
#import "PBPlantEntry.h"

@interface PBPlantTableViewController ()
@property (nonatomic,strong) NSArray* plants;

@end

@implementation PBPlantTableViewController
@synthesize plants;

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
    NSArray* plantNames = [NSArray arrayWithObjects:@"Tomato",@"Cucumber",@"Bellpepper",@"Garlic", @"Onion",@"Potato", nil];
    NSMutableArray* tempPlants = [NSMutableArray array];
    
    for (NSString* name in plantNames){
        PBPlant* plant = [[PBPlant alloc] init];
        plant.name = name;
        
        PBPlantEntry* entry  = [[PBPlantEntry alloc] init];
        entry.date = [NSDate date];
        entry.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpeg", [name lowercaseString],nil]];
        entry.notes = [NSString stringWithFormat:@"Some notes about the %@", [name lowercaseString]];
        
        NSArray* entries = [NSArray arrayWithObject:entry];
        
        plant.entries = entries;
        
        [tempPlants addObject:plant];
    }
    
    self.plants = tempPlants;
    
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
    return self.plants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
    UIImageView* imageView = (UIImageView*) [cell viewWithTag:100];
    UILabel* textLabel = (UILabel*) [cell viewWithTag:101];
    
    // Configure the cell...
    PBPlant* plant = [self.plants objectAtIndex:indexPath.row];
    textLabel.text = plant.name;
    imageView.image = plant.image;
    
    imageView.layer.cornerRadius = 8;
    imageView.layer.masksToBounds = YES;
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([@"presentPlantDetail" isEqualToString:segue.identifier]){
        NSIndexPath *index = [self.tableView indexPathForCell:sender];
        PBPlant *plant = [self.plants objectAtIndex:index.row];
        PBPlantDetailTableViewController* detailViewController = segue.destinationViewController;
        detailViewController.plant = plant;
    }
}

@end
