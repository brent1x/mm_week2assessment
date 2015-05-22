//
//  City.h
//  WeekTwoAssessment
//
//  Created by Brent Dady on 5/22/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface City : NSObject
@property NSString *city;
@property NSString *nickname;
@property UIImage *image;
@property NSString *url;

- (instancetype)initWithName:(NSString *)city nickname:(NSString *)nickname url:(NSString *)url;

@end
