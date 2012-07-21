//
//  PBPlantEntry.h
//  PlanterBox
//
//  Created by Jeff Remer on 7/21/12.
//  Copyright (c) 2012 Strava, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBPlantEntry : NSObject
@property (nonatomic, strong) NSDate* date;
@property (nonatomic, copy) NSString* notes;
@property (nonatomic,strong) UIImage* image;
@end
