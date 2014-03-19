require 'quotation-marks/version'

module QuotationMarks
end

base_directory = File.join(File.dirname(__FILE__), '..')
begin
  require 'compass'
  Compass::Frameworks.register 'quotation-marks', path: base_directory
rescue LoadError
  require 'sass'
  ENV['SASS_PATH'] ||= ''
  ENV['SASS_PATH'] = ENV['SASS_PATH'] + File::PATH_SEPARATOR + File.join(base_directory, 'stylesheets')
end

