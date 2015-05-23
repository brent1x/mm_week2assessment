//
//  CityViewController.h
//  WeekTwoAssessment
//
//  Created by Brent Dady on 5/22/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@class CityViewController;

@protocol CityViewControllerDelegate <NSObject>

- (void) cityView:(CityViewController *)vc onSetTitleButtonTapped:(NSString *)title;

@end

@interface CityViewController : UIViewController

@property City *city;

@property id<CityViewControllerDelegate> delegate;

@end
