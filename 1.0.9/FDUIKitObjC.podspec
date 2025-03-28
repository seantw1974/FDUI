Pod::Spec.new do |spec|
  spec.name         = 'FDUIKitObjC'
  spec.version      = '1.0.9'
  spec.summary      = 'A description of FDUIKitObjC'
  spec.homepage     = 'https://github.com/seantw1974/fdui'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'seantw1974' => 'your-email@example.com' }
  spec.source       = { 
    :git => 'https://github.com/seantw1974/fdui.git', 
    :tag => spec.version.to_s  # 確保 tag 與版本號一致
  }
  spec.source_files = 'Classes/**/*.{h,m,swift}'
  spec.preserve_paths = 'Classes'
end

