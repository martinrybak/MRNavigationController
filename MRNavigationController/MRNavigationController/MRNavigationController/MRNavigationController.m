//
//  MRNavigationController.m
//  MRNavigationController
//
//  Created by Martin Rybak on 9/3/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import "MRNavigationController.h"
#import "MRViewController.h"
#import "MRStack.h"

@interface MRNavigationController ()

@property (strong, nonatomic) MRStack* controllers;
@property (strong, nonatomic) MRViewController* pushedController;

@end

@implementation MRNavigationController

#pragma mark - UINavigationController

- (id)initWithRootViewController:(UIViewController*)rootViewController
{
	return [self initWithRootViewController:rootViewController navigationBarHidden:NO toolBarHidden:YES];
}

- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated
{
	[self savePushController:viewController navigationBarHidden:NO toolBarHidden:YES push:nil pop:nil];
	[super pushViewController:viewController animated:animated];
}

#pragma mark - Public

- (id)initWithRootViewController:(UIViewController*)rootViewController navigationBarHidden:(BOOL)navigationBarHidden toolBarHidden:(BOOL)toolBarHidden
{
	if (self = [super initWithRootViewController:rootViewController])
	{
		super.delegate = self;
		self.controllers = [[MRStack alloc] init];
        [self savePushController:rootViewController navigationBarHidden:navigationBarHidden toolBarHidden:toolBarHidden push:nil pop:nil];
	}
	return self;
}

- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated navigationBarHidden:(BOOL)navigationBarHidden toolBarHidden:(BOOL)toolBarHidden push:(void(^)(void))onPush pop:(void(^)(void))onPop
{
    [self savePushController:viewController navigationBarHidden:navigationBarHidden toolBarHidden:toolBarHidden push:onPush pop:onPop];
	[super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController*)navigationController willShowViewController:(UIViewController*)viewController animated:(BOOL)animated
{
	//This is a push that just started
	if (viewController == self.pushedController.controller)
	{
		//Show or hide the navigation contoller's navigation bar and tool bar according to the pushed controller's preferences
		[self setNavigationBarHidden:self.pushedController.navigationBarHidden toolBarHidden:self.pushedController.toolBarHidden animated:animated];
	}
	//This is a pop that just started
	else
	{
		//Get the top controller
		MRViewController* topController = [self.controllers pop];
		
		//Execute its pop handler
		if (topController.onPop)
			topController.onPop();
		
		//If this a multi-level pop, remove the popped controllers from our internal stack
		while (((MRViewController*)[self.controllers peek]).controller != viewController)
			[self.controllers pop];
			
		//Show or hide the navigation contoller's navigation bar and tool bar according to the new top controller's preferences
		topController = [self.controllers peek];
		[self setNavigationBarHidden:topController.navigationBarHidden toolBarHidden:topController.toolBarHidden animated:animated];
	}
}

- (void)navigationController:(UINavigationController*)navigationController didShowViewController:(UIViewController*)viewController animated:(BOOL)animated
{
	//This is a push that just completed
	if (viewController == self.pushedController.controller)
	{
		//Execute its completion handler
		if (self.pushedController.onPush)
			self.pushedController.onPush();
		
		//Add it to our internal stack
		[self.controllers push:self.pushedController];
		
		//Reset the temp variable
		self.pushedController = nil;
	}
}

#pragma mark - Private

- (void)savePushController:(UIViewController*)viewController navigationBarHidden:(BOOL)navigationBarHidden toolBarHidden:(BOOL)toolBarHidden push:(void(^)(void))onPush pop:(void(^)(void))onPop
{
    self.pushedController = [[MRViewController alloc] init];
	self.pushedController.controller = viewController;
	self.pushedController.navigationBarHidden = navigationBarHidden;
	self.pushedController.toolBarHidden = toolBarHidden;
	self.pushedController.onPush = onPush;
	self.pushedController.onPop = onPop;
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden toolBarHidden:(BOOL)toolBarHidden animated:(BOOL)animated
{
	[super setNavigationBarHidden:navigationBarHidden animated:animated];
	[super setToolbarHidden:toolBarHidden animated:animated];
}

@end
