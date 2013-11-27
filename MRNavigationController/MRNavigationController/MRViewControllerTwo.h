//
//  MRViewControllerTwo.h
//  MRNavigationController
//
//  Created by Martin Rybak on 11/23/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MRViewControllerTwoDelegate <NSObject>

- (void)showVC3;

@end

@interface MRViewControllerTwo : UIViewController

@property (weak, nonatomic) id<MRViewControllerTwoDelegate> delegate;

@end
