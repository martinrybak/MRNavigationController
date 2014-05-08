//
//  MRNavigationController.m
//  MRNavigationController
//
//  Created by Martin Rybak on 9/3/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import "MRNavigationController.h"
#import "MRViewController.h"
#import "HTDelegateProxy.h"
#import "MRStack.h"

@interface MRNavigationController ()

@property (strong, nonatomic) MRStack* controllers;
@property (strong, nonatomic) MRViewController* pushedController;
@property (strong, nonatomic) HTDelegateProxy* delegateProxy;

@end

@implementation MRNavigationController

#pragma mark - UINavigationController

- (id)initWithRootViewController:(UIViewController*)rootViewController
{
	return [self initWithRootViewController:rootViewController navigationBarHidden:NO toolbarHidden:YES];
}

- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated
{
	[self savePushController:viewController navigationBarHidden:NO toolbarHidden:YES push:nil pop:nil];
	[super pushViewController:viewController animated:animated];
}

#pragma mark - Public

- (void)setDelegate:(id<UINavigationControllerDelegate>)delegate
{
    self.delegateProxy = [[HTDelegateProxy alloc] initWithDelegates:@[ self, delegate ]];
    super.delegate = (id)self.delegateProxy;
}

- (id)initWithRootViewController:(UIViewController*)rootViewController navigationBarHidden:(BOOL)navigationBarHidden toolbarHidden:(BOOL)toolbarHidden
{
	if (self = [super initWithRootViewController:rootViewController])
	{
        self.delegateProxy = [[HTDelegateProxy alloc] initWithDelegates:@[ self ]];
		super.delegate = (id)self.delegateProxy;
		self.controllers = [[MRStack alloc] init];
        [self savePushController:rootViewController navigationBarHidden:navigationBarHidden toolbarHidden:toolbarHidden push:nil pop:nil];
	}
	return self;
}

- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated navigationBarHidden:(BOOL)navigationBarHidden toolbarHidden:(BOOL)toolbarHidden push:(void(^)(void))onPush pop:(void(^)(void))onPop
{
    [self savePushController:viewController navigationBarHidden:navigationBarHidden toolbarHidden:toolbarHidden push:onPush pop:onPop];
	[super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController*)navigationController willShowViewController:(UIViewController*)viewController animated:(BOOL)animated
{
	//This is a push that just started
	if (viewController == self.pushedController.controller)
	{
		//Show or hide the navigation contoller's navigation bar and tool bar according to the pushed controller's preferences
		[self setNavigationBarHidden:self.pushedController.navigationBarHidden toolbarHidden:self.pushedController.toolbarHidden animated:animated];
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
		[self setNavigationBarHidden:topController.navigationBarHidden toolbarHidden:topController.toolbarHidden animated:animated];
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
		
		//Reset the temp variable
		self.pushedController = nil;
	}
}

#pragma mark - Private

- (void)savePushController:(UIViewController*)viewController navigationBarHidden:(BOOL)navigationBarHidden toolbarHidden:(BOOL)toolbarHidden push:(void(^)(void))onPush pop:(void(^)(void))onPop
{
    self.pushedController = [[MRViewController alloc] init];
	self.pushedController.controller = viewController;
	self.pushedController.navigationBarHidden = navigationBarHidden;
	self.pushedController.toolbarHidden = toolbarHidden;
	self.pushedController.onPush = onPush;
	self.pushedController.onPop = onPop;
	[self.controllers push:self.pushedController];
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden toolbarHidden:(BOOL)toolbarHidden animated:(BOOL)animated
{
	[super setNavigationBarHidden:navigationBarHidden animated:animated];
	[super setToolbarHidden:toolbarHidden animated:animated];
}

@end
