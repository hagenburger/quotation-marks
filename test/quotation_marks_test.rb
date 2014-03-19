require 'test_helper'

describe 'quotation marks' do

  it 'should use english quotation marks' do
    assert_sass <<-SCSS, <<-CSS
      @import "quotation-marks";
      .my-class {
        @include quotation-marks(en);
      }
    SCSS
      .my-class:before {
        content: "“";
      }

      .my-class:after {
        content: "”";
      }
    CSS
  end

end


