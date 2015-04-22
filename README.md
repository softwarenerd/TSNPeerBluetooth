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
TSNPeerBluetooth requires each peer to uniquely identify itself using a peer identifier. Ideally, this identifier should be reused each time an application based on TSNPeerBluetooth is launched (though this isn't a requrement). Here's one way to do this:
<div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#007400;">//&nbsp;Obtain&nbsp;user&nbsp;defaults&nbsp;and&nbsp;see&nbsp;if&nbsp;we&nbsp;have&nbsp;a&nbsp;serialized&nbsp;peer&nbsp;identifier.&nbsp;If&nbsp;we&nbsp;do,</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#007400;">//&nbsp;deserialize&nbsp;it.&nbsp;If&nbsp;not,&nbsp;make&nbsp;one&nbsp;and&nbsp;serialize&nbsp;it&nbsp;for&nbsp;later&nbsp;use.</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#5c2699;">NSUserDefaults</span><span style="color:#000000;">&nbsp;*&nbsp;userDefaults&nbsp;=&nbsp;[</span><span style="color:#5c2699;">NSUserDefaults</span><span style="color:#000000;">&nbsp;</span><span style="color:#2e0d6e;">standardUserDefaults</span><span style="color:#000000;">];</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#5c2699;">NSData</span><span style="color:#000000;">&nbsp;*&nbsp;peerIdentifierData&nbsp;=&nbsp;[userDefaults&nbsp;</span><span style="color:#2e0d6e;">dataForKey</span><span style="color:#000000;">:PEER_IDENTIFIER_KEY];</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#aa0d91;">if</span><span style="color:#000000;">&nbsp;(!peerIdentifierData)</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">{</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#007400;">//&nbsp;Allocate&nbsp;and&nbsp;initialize&nbsp;a&nbsp;new&nbsp;peer&nbsp;ID.</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#5c2699;">UInt8</span><span style="color:#000000;">&nbsp;uuid[</span><span style="color:#1c00cf;">16</span><span style="color:#000000;">];</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;[[</span><span style="color:#5c2699;">NSUUID</span><span style="color:#000000;">&nbsp;</span><span style="color:#2e0d6e;">UUID</span><span style="color:#000000;">]&nbsp;</span><span style="color:#2e0d6e;">getUUIDBytes</span><span style="color:#000000;">:uuid];</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;peerIdentifierData&nbsp;=&nbsp;[</span><span style="color:#5c2699;">NSData</span><span style="color:#000000;">&nbsp;</span><span style="color:#2e0d6e;">dataWithBytes</span><span style="color:#000000;">:uuid</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#2e0d6e;">length</span><span style="color:#000000;">:</span><span style="color:#aa0d91;">sizeof</span><span style="color:#000000;">(uuid)];</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#007400;">//&nbsp;Serialize&nbsp;and&nbsp;save&nbsp;the&nbsp;peer&nbsp;ID&nbsp;in&nbsp;user&nbsp;defaults.</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;[userDefaults&nbsp;</span><span style="color:#2e0d6e;">setValue</span><span style="color:#000000;">:peerIdentifierData</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#2e0d6e;">forKey</span><span style="color:#000000;">:PEER_IDENTIFIER_KEY];</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">&nbsp;&nbsp;&nbsp;&nbsp;[userDefaults&nbsp;</span><span style="color:#2e0d6e;">synchronize</span><span style="color:#000000;">];</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#000000;">}</span>
    </div>
    <div style="font-family:Menlo,Consolas,monospace;font-size:12px;line-height:14px;">
        <span style="color:#5c2699;">NSUUID</span><span style="color:#000000;">&nbsp;*&nbsp;peerIdentifier&nbsp;=&nbsp;[[</span><span style="color:#5c2699;">NSUUID</span><span style="color:#000000;">&nbsp;</span><span style="color:#2e0d6e;">alloc</span><span style="color:#000000;">]&nbsp;</span><span style="color:#2e0d6e;">initWithUUIDBytes</span><span style="color:#000000;">:[peerIdentifierData&nbsp;</span><span style="color:#2e0d6e;">bytes</span><span style="color:#000000;">]];</span>
    </div>
    <div>
    </div>
</div>


Allocate and initialize a new instance of the TSNPeerBluetooth class as shown below.

The peer identifier uniquely identifies your local peer to nearby peers. It makes sense to reuse the same peer identifier. To accomplish this, I use the following code.
```
// Obtain user defaults and see if we have a serialized peer identifier. If we do, deserialize it. If not, make one
// and serialize it for later use.
NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
NSData * peerIdentifierData = [userDefaults dataForKey:PEER_IDENTIFIER_KEY];
if (!peerIdentifierData)
{
    // Allocate and initialize a new peer identifier.
    UInt8 uuid[16];
    [[NSUUID UUID] getUUIDBytes:uuid];
    peerIdentifierData = [NSData dataWithBytes:uuid
                                        length:sizeof(uuid)];
    
    // Serialize and save the peer identifier in user defaults.
    [userDefaults setValue:peerIdentifierData
                    forKey:PEER_IDENTIFIER_KEY];
    [userDefaults synchronize];
}
NSUUID * peerIdentifier = [[NSUUID alloc] initWithUUIDBytes:[peerIdentifierData bytes]];
```
But you're welcome to use any other technique you like.

Use your own UUID in place of FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF below.

```
NSUUID * serviceType = [[NSUUID alloc] initWithUUIDString:@"FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"];
_peerBluetooth = [[TSNPeerBluetooth alloc] initWithServiceType:serviceType
                                                peerIdentifier:peerIdentifier
                                                      peerName:[[UIDevice currentDevice] name]];
[_peerBluetooth setDelegate:(id<TSNPeerBluetoothDelegate>)self];
```
Once you have a TSNPeerBluetooth instance, use the start method to start your peer:
```
[_peerBluetooth start];
```
And the stop method to stop it:
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
