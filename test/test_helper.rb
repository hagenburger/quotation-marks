require 'minitest/autorun'
require 'quotation-marks'

def assert_sass(scss, css)
  options  = {
    :syntax     => :scss,
    :cache      => false,
    :read_cache => false
  }
  result = Sass::Engine.new(scss, options).render
  result.gsub! %r(@charset "UTF-8";), ''
  result.strip.gsub(/\s+/, ' ').must_equal css.strip.gsub(/\s+/, ' ').strip
end

