//
//  MRViewControllerFour.m
//  MRNavigationController
//
//  Created by Martin Rybak on 11/23/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import "MRViewControllerFour.h"

@interface MRViewControllerFour ()

@end

@implementation MRViewControllerFour

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popToRoot:(id)sender
{
	[self.delegate popToRoot];
}

- (IBAction)popToVC2:(id)sender
{
	[self.delegate popToVC2];
}

- (IBAction)popToVC3:(id)sender
{
    [self.delegate popToVC3];
}

@end
