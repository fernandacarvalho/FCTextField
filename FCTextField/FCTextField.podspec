
Pod::Spec.new do |spec|

  spec.name         = "FCTextField"
  spec.version      = "1.0.0"
  spec.summary      = "Custom UITextField including example App."
  spec.description  = <<-DESC  "Awesome custom UITextField in swift."
                   DESC
  spec.homepage     = "https://github.com/fernandacarvalho/FCText-field"
  spec.license      = "MIT"
  spec.author             = { "Fernanda Carvalho" => "fkn.fernanda@gmail.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/fernandacarvalho/FCText-field.git", :branch => "master", :tag => "#{spec.version}" }
  spec.source_files  = "FCTextField/*"
  spec.resources = "FCTextField/Assets/*.xcassets"
  spec.resource_bundles = {
     'FCTextField' => ['FCTextField/Assets.xcassets']
  }
end
