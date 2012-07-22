//
//  PBPlantEntryViewController.h
//  PlanterBox
//
//  Created by Ashley Shimabuku on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBPlantEntryEditViewController.h"

@class PBPlantEntry;

@interface PBPlantEntryViewController : UIViewController<PBPlantEntryEditViewControllerDelegate>

@property (nonatomic,strong) PBPlantEntry* plantEntry;
@property (nonatomic,strong) NSDateFormatter* dateFormatter;

@end
