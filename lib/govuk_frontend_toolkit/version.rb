module GovUKFrontendToolkit
  def self.toolkit_version
    File.read(File.expand_path('../../app/assets/VERSION.txt', File.dirname(__FILE__)))
  end
end
