# Circle Button

### Easy way to create buttons masked in a circle with colored border without the anti-aliasing distortion

<img src="../master/CircleButton.png" style="width: 200px; float: right;" alt="" />

When setting the corner radius, border color and border width there is often bleeding through to the 
edges as is seen with the screenshot from the StackOverflow question below. This approach eliminates
the bleeding by embedding the masked view without a superview which can also be made circular.

This approach works well with a Storyboard by simply setting the class to `SSTCircleButton` or
`SSTCircleView` with the superview class set to `SSTCircleWrapperView`. The background color of
the superview is used as the border color and the distance between the superview and the wrapped
view is used for the border width.

[StackOverflow Question](http://stackoverflow.com/questions/19565736/ios-rounded-rectangle-with-border-bleeds-color)

## Usage

To run the example project; clone the repo, and run `pod install` from the Example directory first.

## CocoaPods

CircleButton is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod 'CircleButton', '~> 1.1'

or

    pod 'CircleButton', :git => 'https://github.com/brennanMKE/CircleButton.git', :tag => '1.1.1'

[Photo Credit](http://www.fanpop.com/clubs/candice-accola/images/16474223/title/new-hq-headshot-photo)

## License

CircleButton is available under the MIT license. See the LICENSE file for more info.

## Contact

Brennan Stehling  
[SmallSharpTools](http://www.smallsharptools.com/)  
[@smallsharptools](https://twitter.com/smallsharptools) (Twitter)  

