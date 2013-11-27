//
//  MRAppDelegate.h
//  MRNavigationController
//
//  Created by Martin Rybak on 11/23/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRViewControllerOne.h"
#import "MRViewControllerTwo.h"
#import "MRViewControllerThree.h"
#import "MRViewControllerFour.h"

@interface MRAppDelegate : UIResponder
    <UIApplicationDelegate,
    MRViewControllerOneDelegate,
    MRViewControllerTwoDelegate,
    MRViewControllerThreeDelegate,
    MRViewControllerFourDelegate>

@property (strong, nonatomic) UIWindow* window;

@end
