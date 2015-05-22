//
//  CityViewController.m
//  WeekTwoAssessment
//
//  Created by Brent Dady on 5/22/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController ()

@property (weak, nonatomic) IBOutlet UITextField *cityName;
@property (weak, nonatomic) IBOutlet UITextField *cityNickname;

@property (weak, nonatomic) IBOutlet UIImageView *cityImage;

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNicknameLabel;

// @property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@property BOOL isEditing;



@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", self.city.url);

    self.cityName.hidden = TRUE;
    self.cityNickname.hidden = TRUE;

    self.cityName.text = self.city.city;
    self.cityNameLabel.text = self.city.city;

    self.cityImage.image = self.city.image;

    self.cityNickname.text = self.city.nickname;
    self.cityNicknameLabel.text = self.city.nickname;

    [self.cityName addTarget:self action:@selector(updateTitleUsingTextField:) forControlEvents:UIControlEventEditingChanged];



}

#pragma mark - Editing Function
- (IBAction)onEditButtonPressed:(id)sender {

    if (!self.isEditing) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.cityName.text = self.city.city;
        self.cityNickname.text = self.city.nickname;
    }

    else {

        [sender setTitle:@"Edit" forState:UIControlStateNormal];

        if (self.cityName.text.length > 0) {
            self.city.city = self.cityName.text;
            self.cityNameLabel.text = self.city.city;
            self.navigationItem.title = self.city.city;
            self.city.nickname = self.cityNickname.text;
            self.cityNicknameLabel.text = self.city.nickname;
        }
        else {
            self.navigationItem.title = self.city.city;
        }

    }

    // toggle bools (isEditing, textField hidden)
    self.isEditing = !self.isEditing;
    self.cityName.hidden = !self.cityName.hidden;
    self.cityNickname.hidden = !self.cityNickname.hidden;

}

- (void)updateTitleUsingTextField:(UITextField *)sender {
    self.navigationItem.title = sender.text;
}

#pragma mark - Wikipedia Web View

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    City *city = self.city;
    CityViewController *cityVC = segue.destinationViewController;
    cityVC.city = city;
}

@end
