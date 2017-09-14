//
//  MainViewController.m
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-objc v0.20
//
#import <Foundation/Foundation.h>
#import "MainViewController.h"
#import "DemoFeature.h"

static NSString * LOG_TAG = @"MainViewController";

@interface MainViewController ()

@property (nonatomic, strong) NSMutableArray *demoFeatures;


@end

@implementation MainViewController

#pragma mark - View Controller lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                         style:UIBarButtonItemStylePlain
                                        target:nil
                                        action:nil];

    // Default theme settings.
    [self.navigationController.navigationBar
        setBackgroundColor:[UIColor colorWithRed:1.0f
                                           green:1.0f
                                            blue:1.0f
                                           alpha:1.0]];
    [self.navigationController.navigationBar
        setBarTintColor:[UIColor colorWithRed:0xF5/255.0f
                                        green:0x85/255.0f
                                         blue:0x35/255.0f
                                        alpha:1.0]];
    [self.navigationController.navigationBar
        setTintColor:[UIColor whiteColor]];


    NSLog(@"%@: Loading...", LOG_TAG);
    self.demoFeatures = [[NSMutableArray alloc] init];

    DemoFeature *demoFeature =
        [[DemoFeature alloc] initWithName:NSLocalizedString(@"User Sign-in",
                                                            @"Label for demo menu option.")
                                   detail:NSLocalizedString(@"Enable user login with popular 3rd party providers.",
                                                            @"Description for demo menu option.")
                                     icon:@"UserIdentityIcon"
                               storyboard:@"UserIdentity"];
    [self.demoFeatures addObject:demoFeature];
    
    
    
    
    demoFeature =
    [[DemoFeature alloc] initWithName:NSLocalizedString(@"Conversational Bots",
                                                        @"Label for demo menu option.")
                               detail:NSLocalizedString(@"Understand user intent and trigger business workflows using voice and chat interfaces.",
                                                        @"Description for demo menu option.")
                                 icon:@"BotsIcon"
                           storyboard:@"Bots"];
    [self.demoFeatures addObject:demoFeature];
}



#pragma mark - UITableViewController delegates

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainViewCell"];
    
    DemoFeature *demoFeature = self.demoFeatures[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[demoFeature icon]];
    cell.textLabel.text = [demoFeature displayName];
    cell.detailTextLabel.text = [demoFeature detailText];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.demoFeatures count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    DemoFeature *demoFeature = [self.demoFeatures objectAtIndex:indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:demoFeature.storyboard
                                                         bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:demoFeature.storyboard];
    
    [self.navigationController pushViewController:viewController
                                         animated:YES];
}

#pragma mark -




@end

@implementation FeatureDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.backBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                         style:UIBarButtonItemStylePlain
                                        target:nil
                                        action:nil];
}

@end
