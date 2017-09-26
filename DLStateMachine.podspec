Pod::Spec.new do |s|
  s.name             = "DLStateMachine"
  s.version          = "0.9.0"
  s.summary          = "A lightweight hierarchical state machine framework in Objective-C."
  s.description      = <<-DESC
                       Supports all common features of a UML state machine like:

                       - nested states
                       - orthogonal regions
                       - pseudo states
                       - transitions with guards and actions
                       - state switching using least common ancestor algorithm and run-to-completion model
                       DESC
  s.homepage         = "https://github.com/daluethi/DLStateMachine"
  s.license          = 'MIT'
  s.author           = 'Daniel Luethi'
  s.social_media_url = "http://twitter.com/daluethi"

  s.ios.deployment_target = '6.0'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.8'

  s.requires_arc = true
  s.source = { :git => "https://github.com/daluethi/DLStateMachine.git", :tag => s.version.to_s }

  s.default_subspec = 'Core'
  s.subspec 'Core' do |core|
    core.source_files = 'Pod/Core'
  end

  s.subspec 'DebugSupport' do |debug|
    debug.source_files = 'Pod/DebugSupport'
    debug.dependency 'DLStateMachine/Core'
  end
end
