# MRNavigationController

A **UINavigationController** subclass with a **pushViewController** method that accepts **push** and **pop** blocks, as well as **navigation bar** and **toolbar** visibility settings, for each pushed controller. Here is an example:

```sh
#import "MRNavigationController.h"

self.vc1 = [[UIViewController alloc] init];
self.vc2 = [[UIViewController alloc] init];
self.nav = [[MRNavigationController alloc] initWithRootViewController:self.vc1 navigationBarHidden:YES toolbarHidden:YES];
[self.nav pushViewController:self.vc2 animated:YES navigationBarHidden:NO toolbarHidden:NO push:^{
    NSLog(@"VC1 pushed VC2");
}
pop:^{
	NSLog(@"VC2 popped");
	self.vc2 = nil;
}];
```

In this sample, the navigation controller will display the **vc1** view controller with no navigation bar and no toolbar. The first log statement will then be printed. The **vc2** view controller will then be animated onto the screen with a navigation bar and toolbar. When its back button is pressed, the second log statement will be printed, the **vc2** view controller will be animated away and cleared from memory, and the **vc1** view controller will once again appear with no navigation bar and no toolbar.

The **pop** block is executed whether the back button is pressed or if the view controller is popped manually via one of the standard pop methods:

* popViewControllerAnimated:
* popToViewController:animated:
* popToRootViewControllerAnimated:

The following superclass methods can still be used, but pushed view controllers will be assigned a default of **navigationBarHidden:NO** and **toolbarHidden:YES** and no push or pop blocks will be executed:

* initWithRootViewController:
* pushViewController:animated:

You can still use your own delegate thanks to a trick from a fantastic library called [HTDelegateProxy]. 

For a live example, download and run the Xcode project.

## Installation
I’ve published this library as a [CocoaPod], which is the easiest way to install it. Otherwise, simply manually copy these [class files] and [HTDelegateProxy] files into your project.

  [CocoaPod]: http://www.cocoapods.org/?q=MRNavigationController
  [class files]: https://github.com/martinrybak/MRNavigationController/tree/master/MRNavigationController/MRNavigationController/MRNavigationController
  [HTDelegateProxy]: https://github.com/hoteltonight/HTDelegateProxy/archive/master.zip
    
