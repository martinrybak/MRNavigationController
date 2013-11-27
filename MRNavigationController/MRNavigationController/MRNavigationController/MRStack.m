//
//  MRStack.m
//  MRNavigationController
//
//  Created by Martin Rybak on 8/14/13.
//  Copyright (c) 2013 Martin Rybak. All rights reserved.
//

#import "MRStack.h"

@interface MRStack ()

@property (strong, nonatomic) NSMutableArray* array;

@end

@implementation MRStack

- (id)init
{
	if (self = [super init])
	{
		self.array = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)push:(id)object
{
	[self.array addObject:object];
}

- (id)pop
{
	id lastObject = [self.array lastObject];
	[self.array removeLastObject];
	return lastObject;
}

- (id)peek
{
	return [self.array lastObject];
}

- (void)clear
{
	[self.array removeAllObjects];
}

- (NSUInteger)count
{
	return self.array.count;
}

- (BOOL)isEmpty
{
	return self.array.count == 0;
}

@end
