# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace "MVVMMovie"
target 'MVVMMovie' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MVVMMovie

  # Helper
   pod 'SwiftLint', '~> 0.49'
   
   # UI
   pod 'lottie-ios'
   pod 'SwiftEntryKit', '2.0.0'
   pod 'TinyConstraints', '~> 4.0'
   
   # Network
   pod 'Firebase/RemoteConfig'
   pod 'Alamofire', '~> 5.6'


end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider
  
  # Network
 

end

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  
  # Helper
  pod 'SwiftGen', '~> 6.6'
  
  # UI
  pod 'lottie-ios'
  pod 'TinyConstraints', '~> 4.0'

end
