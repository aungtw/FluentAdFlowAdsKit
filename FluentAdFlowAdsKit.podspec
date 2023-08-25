Pod::Spec.new do |s|
s.name             = 'FluentAdFlowAdsKit'  
s.version          = '0.0.1'  
s.summary          = 'Fluent Ad Kit View' 
s.description      = 'This is Fluent Ad Kit View Component'

s.homepage         = 'https://github.com/aungtw/FluentAdFlowAdsKit.git'
s.license          =  { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
  }
s.author           = { 'awongfluentco' => 'awong@fluentco.com' } 
s.source           = { :git => 'https://github.com/aungtw/FluentAdFlowAdsKit.git', :tag => s.version.to_s } 
s.ios.deployment_target = '13.0'
s.source_files = 'FluentAdFlowAdsKit/FluentAdFlowAdsKit/*' 
s.swift_versions = '5.8'
end