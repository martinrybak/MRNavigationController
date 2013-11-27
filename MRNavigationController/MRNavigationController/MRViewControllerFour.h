//
//  MRViewControllerFour.h
//  MRNavigationController
//
//  Created by Martin Rybak on 11/23/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MRViewControllerFourDelegate <NSObject>

- (void)popToRoot;
- (void)popToVC2;
- (void)popToVC3;

@end

@interface MRViewControllerFour : UIViewController

@property (weak, nonatomic) id<MRViewControllerFourDelegate> delegate;

@end
