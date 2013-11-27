//
//  MRViewControllerThree.h
//  MRNavigationController
//
//  Created by Martin Rybak on 11/23/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MRViewControllerThreeDelegate <NSObject>

- (void)showVC4;

@end

@interface MRViewControllerThree : UIViewController

@property (weak, nonatomic) id<MRViewControllerThreeDelegate> delegate;

@end
