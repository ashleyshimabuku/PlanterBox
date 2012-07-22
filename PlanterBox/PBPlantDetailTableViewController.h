//
//  PBPlantDetailTableViewController.h
//  PlanterBox
//
//  Created by Ashley Shimabuku on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBPlantEntryEditViewController.h"

@class PBPlant;

@interface PBPlantDetailTableViewController : UITableViewController<PBPlantEntryEditViewControllerDelegate>

@property (nonatomic,strong) PBPlant* plant;
@property (nonatomic,strong) NSDateFormatter* dateFormatter;

@end
