$:.push File.expand_path("../lib", __FILE__)

require "govuk_frontend_toolkit/version"

Gem::Specification.new do |s|
  s.name         = "govuk_frontend_toolkit"
  s.version      = GovUKFrontendToolkit.toolkit_version
  s.summary      = 'Tools for building frontend applications'
  s.authors      = ["Government Digital Service"]
  s.email        = ["govuk-dev@digital.cabinet-office.gov.uk"]
  s.homepage     = 'https://github.com/alphagov/govuk_frontend_toolkit'
  s.license      = 'MIT'

  s.add_dependency "railties", ">= 3.1.0"

  s.add_development_dependency "rake", "0.9.2.2"

  s.require_paths = ["lib", "app"]
  s.files         = `git ls-files`.split($\)

  # We need to include the files from the submodules, example from:
  # http://somethingaboutcode.wordpress.com/2012/09/27/include-files-from-git-submodules-when-building-a-ruby-gem/

  gemroot_path = `pwd`.strip
  # get an array of submodule dirs by executing 'pwd' inside each submodule
  `git submodule --quiet foreach pwd`.split($\).each do |submodule_path|
    # for each submodule, change working directory to that submodule
    Dir.chdir(submodule_path) do

      # issue git ls-files in submodule's directory
      submodule_files = `git ls-files`.split($\)

      # prepend the submodule path to create absolute file paths
      submodule_files_fullpaths = submodule_files.map do |filename|
        "#{submodule_path}/#{filename}"
      end

      # remove leading path parts to get paths relative to the gem's root dir
      # (this assumes, that the gemspec resides in the gem's root dir)
      submodule_files_paths = submodule_files_fullpaths.map do |filename|
        filename.gsub "#{gemroot_path}/", ""
      end

      # add relative paths to gem.files
      s.files += submodule_files_paths
    end
  end
end
