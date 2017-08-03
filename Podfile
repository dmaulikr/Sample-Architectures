# Uncomment this line to define a global platform for your project
platform :ios, '9.0'

def main_pods
    use_frameworks!
    
    pod 'Alamofire', '~> 4.2'
    pod 'SnapKit', '~> 3.0'
    
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxBlocking'
    pod 'RxOptional'
    pod 'RxAlamofire'
    
    pod 'JLRoutes'
    
    pod 'PKHUD', '~> 4.0'
end

target 'Sample-Architectures-MVC' do
  main_pods
end

target 'Sample-Architectures-MVVM' do
    main_pods
end

target 'Sample-Architectures-PureMVC' do
    main_pods
    pod 'puremvc'
end

target 'Sample-Architectures-Viper' do
    main_pods
end

target 'Sample-ArchitecturesTests' do
    use_frameworks!
    
    pod 'Nimble', '~> 5.1'
    pod 'Quick', '~> 1.0'
end

target 'Acceptance Tests' do
    use_frameworks!
    
    pod 'Nimble', '~> 5.1'
    pod 'Quick', '~> 1.0'
    pod 'KIF', '~> 3.0', :configurations => ['Debug']
end
