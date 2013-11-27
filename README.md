# MRNavigationController

A **UINavigationController** with a **pushViewController** method that accepts **push** and **pop** blocks, as well as **navigation bar** and **toolbar** visibility settings, for each pushed controller. Here is a sample:

```sh
#import "MRNavigationController.h"

self.vc1 = [[UIViewController alloc] init];
self.vc2 = [[UIViewController alloc] init];
self.nav = [[MRNavigationController alloc] initWithRootViewController:self.vc1 navigationBarHidden:YES toolbarHidden:YES];
[self.nav pushViewController:self.vc2 animated:YES navigationBarHidden:NO toolbarHidden:NO push:^{
    NSLog(@"VC1 pushed VC2");
} pop:^{
	NSLog(@"VC2 popped");
	self.vc2 = nil;
}];
```
In this example, the navigation controller will display the **vc1** view controller with no navigation bar and no toolbar. It will then push the **vc2** view controller *with* a navigation bar and toolbar. When the push animation is complete, it will write “VC1 pushed VC2″ to the console. When its back button is pressed, it will write “VC2 popped” to the console, the **vc2** view controller will be removed (with animation), and the **vc1** view controller will once again appear with no navigation bar and no toolbar.

The pop handler is also invoked if the view controller is popped manually via one of the standard pop methods:

* popViewControllerAnimated:
* popToViewController:animated:
* popToRootViewControllerAnimated:

Note that the **initWithRootViewController** method also takes navigation bar and toolbar visibility parameters. If you call the following superclass methods instead, it will assign a default of **navigationBarHidden:NO** and **toolbarHidden:YES**.

* initWithRootViewController:
* pushViewController:animated:

For a live example, download and run the Xcode project.

## Installation
I’ve published this library as a [CocoaPod], which is the easiest way to install it. Otherwise, simply manually copy the [class files] into your project.

  [CocoaPod]: http://www.cocoapods.org/?q=MRNavigationController
  [class files]: https://github.com/martinrybak/MRNavigationController/tree/master/MRNavigationController/MRNavigationController/MRNavigationController
    
