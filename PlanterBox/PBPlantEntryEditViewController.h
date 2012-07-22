//
//  PBPlantEntryEditViewController.h
//  PlanterBox
//
//  Created by Ashley Shimabuku on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PBPlantEntryEditViewController;
@class PBPlantEntry;

@protocol PBPlantEntryEditViewControllerDelegate <NSObject>
- (void)plantEntryEditViewControllerDidCancel:(PBPlantEntryEditViewController*)plantEntryEditViewController;
- (void)plantEntryEditViewControllerDidSave:(PBPlantEntryEditViewController*)plantEntryEditViewController;
@end

@interface PBPlantEntryEditViewController : UIViewController
@property (nonatomic, strong) PBPlantEntry* plantEntry;
@property (nonatomic, weak) id<PBPlantEntryEditViewControllerDelegate> delegate;
@end
