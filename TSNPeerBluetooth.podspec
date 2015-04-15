Pod::Spec.new do |spec|
  spec.name             = 'TSNPeerBluetooth'
  spec.version          = '1.0.2'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/softwarenerd/TSNPeerBluetooth'
  spec.author           = { 'Brian Lambert' => 'brianlambert@softwarenerd.org' }
  spec.summary          = 'Bluetooth LE peer-to-peer library for iOS'
  spec.source           = { :git => 'https://github.com/softwarenerd/TSNPeerBluetooth.git', :tag => 'v1.0.2' }
  spec.source_files     = 'Source/*'
  spec.platform         = :ios, '8.0'
  spec.framework        = 'Foundation', 'CoreLocation', 'CoreBluetooth'
  spec.requires_arc     = true
end