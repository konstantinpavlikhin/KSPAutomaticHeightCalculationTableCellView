Pod::Spec.new do |spec|

  spec.name = 'KSPAutomaticHeightCalculationTableCellView'

  spec.version = '1.3.0'

  spec.authors = {'Konstantin Pavlikhin' => 'k.pavlikhin@gmail.com'}

  spec.social_media_url = 'https://twitter.com/kpavlikhin'

  spec.license = {:type => 'MIT', :file => 'LICENSE.md'}

  spec.homepage = 'https://github.com/konstantinpavlikhin/KSPAutomaticHeightCalculationTableCellView'

  spec.source = {:git => 'https://github.com/konstantinpavlikhin/KSPAutomaticHeightCalculationTableCellView.git', :tag => "#{spec.version}"}

  spec.summary = 'A useful superclass for a custom view-based NSTableViews cell.'

  spec.platform = :osx, "10.11"

  spec.osx.deployment_target = "10.8"

  spec.requires_arc = true

  spec.source_files = 'Sources/*.{h,m}'

end
