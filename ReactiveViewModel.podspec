Pod::Spec.new do |s|
  s.name = 'ReactiveViewModel'
  s.version = '0.3.3'
  s.summary = 'Model-View-ViewModel, using ReactiveCocoa.'
  s.description = 'ReactiveViewModel is a combination code/documentation project for building Cocoa applications using Model-View-ViewModel and ReactiveCocoa.\n\nBy explaining rationale, documenting best practices, and providing reusable library components, we want to make MVVM in Objective-C appealing and easy.'
  s.homepage = 'https://github.com/ReactiveCocoa/ReactiveViewModel'
  s.license = { :type => 'MIT', :file => 'LICENSE.md'}
  s.authors = {
    'Alan Rogers' => 'alan@github.com',
    'Just Spahr-Summers' => 'Justin.SpahrSummers@gmail.com',
    'Josh Abernathy' => 'joshaber@gmail.com'
  }

  s.ios.platform = :ios, '6.0'
  s.osx.platform = :iox, '10.8'
  s.requires_arc = true

  s.source = {
    :git => 'https://github.com/ReactiveCocoa/ReactiveViewModel.git',
    :tag => s.version.to_s
  }
  s.source_files = 'ReactiveViewModel/*.{h,m}' 
  s.dependency 'ReactiveCocoa', '~> 2.4'
  
  s.prepare_command = <<-'END'
    find . \( -regex '.*EXT.*\.[mh]$' -o -regex '.*metamacros\.[mh]$' \) -execdir mv {} RAC{} \;
    find . -regex '.*\.[hm]' -exec sed -i '' -E 's@"(EXT.*|metamacros)\.h"@"RAC\1.h"@' {} \;
    find . -regex '.*\.[hm]' -exec sed -i '' -E 's@<ReactiveCocoa/(EXT.*)\.h>@<ReactiveCocoa/RAC\1.h>@' {} \;
  END
end