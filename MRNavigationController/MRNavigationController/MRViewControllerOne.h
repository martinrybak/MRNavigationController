//
//  MRViewControllerOne.h
//  MRNavigationController
//
//  Created by Martin Rybak on 11/23/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MRViewControllerOneDelegate <NSObject>

- (void)showVC2;

@end

@interface MRViewControllerOne : UIViewController

@property (weak, nonatomic) id<MRViewControllerOneDelegate> delegate;

@end
