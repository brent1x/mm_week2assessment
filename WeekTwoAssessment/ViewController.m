//
//  ViewController.m
//  WeekTwoAssessment
//
//  Created by Brent Dady on 5/22/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityViewController.h"
#import "WebViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *cities;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    City *austin = [[City alloc] initWithName:@"Austin" nickname:@"Bat City" url:@"http://http://en.wikipedia.org/wiki/Austin,_Texas"];
    City *paris = [[City alloc] initWithName:@"Paris" nickname:@"The City of Light" url:@"http://en.wikipedia.org/wiki/Paris"];
    City *sf = [[City alloc] initWithName:@"San Francisco" nickname:@"City By the Bay" url:@"http://en.wikipedia.org/wiki/San_Francisco"];
    City *denver = [[City alloc] initWithName:@"Denver" nickname:@"The Mile-High City" url:@"http://en.wikipedia.org/wiki/Denver"];

    self.cities = [NSMutableArray arrayWithObjects:austin, paris, sf, denver, nil];
}

#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    City *city = [self.cities objectAtIndex:indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];

    cell.textLabel.text = city.city;
    cell.detailTextLabel.text = city.nickname;
    cell.imageView.image = city.image;

    return cell;
}

#pragma mark - Delete Cell Methods

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Delete" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"delete");
            [self.cities removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];

        UIAlertAction *noButton = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [tableView reloadData];
        }];

        [alertController addAction:yesButton];
        [alertController addAction:noButton];

        [self presentViewController:alertController animated:YES completion:nil];
        [tableView reloadData];

    }
    
}

#pragma mark - Segue Method

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    City *city = [self.cities objectAtIndex:indexPath.row];

    [segue.destinationViewController setTitle:city.city];

    CityViewController *cityVC = segue.destinationViewController;
    cityVC.city = city;
}


#pragma mark - View Will Appear

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



@end
