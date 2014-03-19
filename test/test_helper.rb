require 'minitest/autorun'
require 'quotation-marks'
require 'heredoc_unindent'

def assert_sass(scss, css)
  options  = {
    :syntax     => :scss,
    :cache      => false,
    :read_cache => false
  }
  result = Sass::Engine.new(scss, options).render
  result.gsub! %r(@charset "UTF-8";), ''
  css.unindent.strip.must_equal result.unindent.strip
end

