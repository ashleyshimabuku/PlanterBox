//
//  PBPlant.m
//  PlanterBox
//
//  Created by Ashley Shimabuku on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PBPlant.h"
#import "PBPlantEntry.h"
@implementation PBPlant

@synthesize name;
@synthesize image;
@synthesize entries;

-(UIImage *)image
{
    PBPlantEntry* entry = [self.entries lastObject];
    return entry.image;
}

@end
