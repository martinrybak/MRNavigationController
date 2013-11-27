//
//  MRViewController.h
//  MRNavigationController
//
//  Created by Martin Rybak on 11/23/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRViewController : NSObject

@property (weak, nonatomic) UIViewController* controller;
@property (assign, nonatomic) BOOL navigationBarHidden;
@property (assign, nonatomic) BOOL toolBarHidden;
@property (copy, nonatomic) void(^onPush)(void);
@property (copy, nonatomic) void(^onPop)(void);

@end
