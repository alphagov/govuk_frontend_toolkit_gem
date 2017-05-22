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

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "sass", ">= 3.2.0"
  s.add_development_dependency "rake", "0.9.2.2"

  s.require_paths = ["lib", "app"]
  s.files         = `git ls-files`.split("\n")

  `git submodule init`
  `git submodule update`

  `git submodule foreach`.split("\n").each do |line|
    submodule_path = line.split[1].gsub('\'', '')

    Dir.chdir(submodule_path) do
      unwanted = ["jenkins.sh"]
      (`git ls-files`.split("\n") - unwanted).each do |submodule_file|
        s.files << "#{submodule_path}/#{submodule_file}"
      end
    end
  end
end
