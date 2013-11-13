# Circle Button

### Easy way to create buttons masked in a circle with colored border without the antialiasing distortion

When setting the corner radius, border color and border width there is often bleeding through to the 
edges as is seen with the screenshot from the StackOverflow question below. This approach eliminates
the bleeding by embedding the masked view without a superview which can also be make circular.

This approach works well with a Storyboard by simply setting the class to `SSTCircleButton` or
`SSTCircleView` with the superview class set to `SSTWrappedCircleView`. The background color of
the superview is used as the border color and the distance between the superview and the wrapped
view is used for the border width.

[StackOverflow](http://stackoverflow.com/questions/19565736/ios-rounded-rectangle-with-border-bleeds-color)

[Photo Credit](http://www.fanpop.com/clubs/candice-accola/images/16474223/title/new-hq-headshot-photo)

### Brennan Stehling
#### SmallSharpTools.com

Find me on [Twitter](http://twitter.com/smallsharptools) and [App.net](http://alpha.app.net/smallsharptools).
