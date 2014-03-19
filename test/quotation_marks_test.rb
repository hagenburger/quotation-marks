require 'test_helper'

describe 'quotation marks' do

  it 'initial test' do
    assert_sass <<-SCSS, <<-CSS
      @import "quotation-marks";
      .my-class {
        &:before {
          content: "“";
        }
      }
    SCSS
      .my-class:before {
        content: "“"; }
    CSS
  end

end


