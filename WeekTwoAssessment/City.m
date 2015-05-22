//
//  City.m
//  WeekTwoAssessment
//
//  Created by Brent Dady on 5/22/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithName:(NSString *)city nickname:(NSString *)nickname url:(NSString *)url {
    self = [super init];
    self.city = city;
    self.nickname = nickname;
    self.url = url;
    self.image = [UIImage imageNamed:city];
    return self;
}

@end
