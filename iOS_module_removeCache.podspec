Pod::Spec.new do |s|
  s.name         = "iOS_module_removeCache"
  s.version      = "1.0.0"
  s.summary      = "幻熊清楚缓存"
  s.homepage     = "https://github.com/halobear/iOS_module_removeCache.git"
  s.license      = "MIT"
  s.author       = { "liujidan" => "liujidanjob@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/halobear/iOS_module_removeCache.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.source_files = "RemoveCache/*.{h,m}"
end
