TSNLogger
=========
TSNLogger iOS logging utility class.

Using TSNLogger
---------------
Add TSNLogger to your podfile.
```
pod 'TSNLogger'
```
And install it using:
```
pod install
```
How TSNLogger Works
-------------------
TSNLogger is an iOS logging utility class. It allows one to write log entries by calling TSNLog instead of NSLog. As log entries are written, they are accumulated and stored in memory for display at any time.

To display log entries, use the:
```
- (UIView *)createLoggerViewWithFrame:(CGRect)frame
                      backgroundColor:(UIColor *)backgroundColor
                      foregroundColor:(UIColor *)foregroundColor
```
method to create and display the logger view in your application. This view can be made any convenient size and placed in any container view. Once created and added to a container view, it will display the accumulated log entries at the moment it was created and new log entries as they are written.
Usage Examples
--------------
Writing to TSNLogger:
```
TSNLog(@"The device name is %@", [[UIDevice currentDevice] name]);
```
Display the logger view:
```
// Initialize TSNLogger and display a full-screen logger view.
TSNLogger * logger = [TSNLogger singleton];
[logger setMaxLogEntries:500];
[logger setWriteToAppleSystemLog:YES];
[[self view] addSubview:[logger createLoggerViewWithFrame:[[UIScreen mainScreen] bounds]
                                          backgroundColor:[UIColor clearColor]
                                          foregroundColor:[UIColor blackColor]]];
```
License
-------
TSNLogger is released under an MIT license, meaning you're free to use it in both closed and open source projects. However, even in a closed source project, please include a publicly-accessible copy of TSNLogger's copyright notice, which you can find in the LICENSE file.

Feedback
--------
If you have any questions, suggestions, or contributions to TSNLogger, please [contact me](mailto:brianlambert@softwarenerd.org).
