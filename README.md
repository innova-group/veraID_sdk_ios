# veraID-sdk-ios

[![CI Status](https://img.shields.io/travis/lagrunge/veraID-sdk-ios.svg?style=flat)](https://travis-ci.org/lagrunge/veraID-sdk-ios)
[![Version](https://img.shields.io/cocoapods/v/veraID-sdk-ios.svg?style=flat)](https://cocoapods.org/pods/veraID-sdk-ios)
[![License](https://img.shields.io/cocoapods/l/veraID-sdk-ios.svg?style=flat)](https://cocoapods.org/pods/veraID-sdk-ios)
[![Platform](https://img.shields.io/cocoapods/p/veraID-sdk-ios.svg?style=flat)](https://cocoapods.org/pods/veraID-sdk-ios)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

veraID-sdk-ios is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'VeraIdSdk', :git => 'https://github.com/innova-group/veraID_sdk_ios', :branch => 'master'
```
## Usage

To handle authorization response:
1) Go to your project -> target -> Info -> URL Types
2) Click `Add` button
3) Set URL Schemes to `vera-id-partner-<partnerID>`, for example `vera-id-partner-1`
4) Import SDK to your authorization module
```import VeraIdSdk```
5) Set partner id and delegate
```swift
VeraID.shared.partnerId = 1
VeraID.shared.delegate = self
```
5) Add new `VeraIdButton` to your authorization controller, through code or storyboard. It automatically configures it's appearance.
6) Request authorization on button tap:
```VeraID.shared.authenticate(requesting: [.fio, .email__value, .driver_license__expiry_date])```
7) Implement delegate method to handle token from VeraID application.

For usage example refer to the Example project.

## Author

Innova Dev Team

## License

veraID-sdk-ios is available under the MIT license. See the LICENSE file for more info.
