TSNPeerBluetooth
================
Bluetooth LE peer-to-peer library for iOS.

Using TSNPeerBluetooth
----------------------
Add TSNPeerBluetooth to your podfile.
```
pod 'TSNPeerBluetooth'
```
And install it using:
```
pod install
```
How TSNPeerBluetooth Works
--------------------------
Allocate and initialize a new instance of the TSNPeerBluetooth class as shown below.
```
// Allocate and initialize the service type.
NSUUID * serviceType = [[NSUUID alloc] initWithUUIDString:@"FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"];

// Static declarations.
static NSString * const PEER_IDENTIFIER_KEY = @"PeerIdentifierKey";
    
// Obtain user defaults and see if we have a serialized peer identifier. If we do,
// deserialize it. If not, make one and serialize it for later use.
NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
NSData * peerIdentifierData = [userDefaults dataForKey:PEER_IDENTIFIER_KEY];
if (!peerIdentifierData)
{
    // Create a new peer identifier.
    UInt8 uuid[16];
    [[NSUUID UUID] getUUIDBytes:uuid];
    peerIdentifierData = [NSData dataWithBytes:uuid
                                        length:sizeof(uuid)];
    
    // Save the peer identifier in user defaults.
    [userDefaults setValue:peerIdentifierData
                    forKey:PEER_IDENTIFIER_KEY];
    [userDefaults synchronize];
}
NSUUID * peerIdentifier = [[NSUUID alloc] initWithUUIDBytes:[peerIdentifierData bytes]];

// Allocate and initialize the peer Bluetooth context.
_peerBluetooth = [[TSNPeerBluetooth alloc] initWithServiceType:serviceType
                                                peerIdentifier:peerIdentifier
                                                      peerName:[[UIDevice currentDevice] name]];
[_peerBluetooth setDelegate:(id<TSNPeerBluetoothDelegate>)self];
```
Use your own UUID in place of FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF.

Once you have a TSNPeerBluetooth instance, use the start method to start your peer:
```
[_peerBluetooth start];
```
And the stop method to stop your peer:
```
[_peerBluetooth stop];
```
To update your peer's location, call the updateLocation method:
```
[_peerBluetooth updateLocation:location];
```
To update your peer's status, call the updateStatus method:
```
[_peerBluetooth updateStatus:@"My new status!"];
```




License
-------
TSNPeerBluetooth is released under an MIT license, meaning you're free to use it in both closed and open source projects. However, even in a closed source project, please include a publicly-accessible copy of TSNPeerBluetooth's copyright notice, which you can find in the LICENSE file.

Feedback
--------
If you have any questions, suggestions, or contributions to TSNPeerBluetooth, please [contact me](mailto:brianlambert@softwarenerd.org).
