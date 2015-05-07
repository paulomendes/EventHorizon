# EventHorizon
This is a library to fake a gps location on iOS

[![CI Status](http://img.shields.io/travis/Paulo Mendes/EventHorizon.svg?style=flat)](https://travis-ci.org/Paulo Mendes/EventHorizon)
[![Version](https://img.shields.io/cocoapods/v/EventHorizon.svg?style=flat)](http://cocoapods.org/pods/EventHorizon)
[![License](https://img.shields.io/cocoapods/l/EventHorizon.svg?style=flat)](http://cocoapods.org/pods/EventHorizon)
[![Platform](https://img.shields.io/cocoapods/p/EventHorizon.svg?style=flat)](http://cocoapods.org/pods/EventHorizon)

## Usage

To start EventHorizon in your app just do

```objc
[[EventHorizon instance] enable];
```

For now, your CLLocationManager will send update locations only when you call

```objc
- (void)fakeLocation:(CLLocation *)fakeLocation
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

EventHorizon is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "EventHorizon"
```

## Author

Paulo Mendes, paulo.mendes87@gmail.com

## License

EventHorizon is available under the MIT license. See the LICENSE file for more info.



