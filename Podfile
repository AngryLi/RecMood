# Uncomment the next line to define a global platform for your project

source 'https://github.com/CocoaPods/Specs.git'  # 官方库

platform :ios, '9.0'

def reactive_swift
    # pod 'ReactiveSwift', '~> 1.1'
    pod 'ReactiveCocoa'
end

def rx_swift
    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'
end

def dev_pods
#pod 'SDWebImage'
#pod 'SDWebImage/WebP'
#pod 'SDWebImage/GIF'
pod 'Kingfisher', '~> 3.0' # 异步图片加载
pod 'Alamofire', '~> 4.0' # 网络
end

target 'RecMood' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  dev_pods
  
  rx_swift
  
end
