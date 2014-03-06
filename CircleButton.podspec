Pod::Spec.new do |s|
  s.name             = "CircleButton"
  s.version          = "0.1.0"
  s.summary          = "Easy way to create buttons masked in a circle with colored border without the anti-aliasing distortion"
  s.description      = <<-DESC
When setting the corner radius, border color and border width there is often bleeding through to the 
edges as is seen with the screenshot from the StackOverflow question below. This approach eliminates
the bleeding by embedding the masked view without a superview which can also be made circular.
                       DESC
  s.homepage         = "http://www.smallsharptools.com/"
  s.license          = 'MIT'
  s.author           = { "Brennan Stehling" => "brennan@smallsharptools.com" }
  s.source           = { :git => "https://github.com/brennanMKE/CircleButton.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/smallsharptools'

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.public_header_files = 'Classes/*.h'
  s.source_files = 'Classes/*'

  s.frameworks = 'QuartzCore'
end
