# MRNavigationController

A **UINavigationController** with a **pushViewController** method that accepts **push** and **pop** blocks, as well as **navigation bar** and **toolbar** visibility settings, for each pushed controller. Here is a usage example:

```sh
#import "MRNavigationController.h"

self.vc1 = [[UIViewController alloc] init];
self.vc2 = [[UIViewController alloc] init];
self.nav = [[UINavigationController alloc] initWithRootViewController:self.vc1 navigationBarHidden:YES toolbarHidden:YES];
[self.nav pushViewController:self.vc2 animated:YES navigationBarHidden:NO toolbarHidden:NO push:^{
    NSLog(@"VC1 pushed VC2");
} pop:^{
	NSLog(@"VC2 popped");
	self.vc2 = nil;
}];
```
The **push** handler is executed after a view controller has finished animating onto the screen. The **pop** handler is invoked when the back button is pressed on that controller, or if it is popped in code via one of the standard pop methods:

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
    
