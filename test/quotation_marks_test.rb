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

  it 'should use english and german quotation marks and use as few selectors as possible' do
    assert_sass <<-SCSS, <<-CSS
      @import "quotation-marks";
      .my-class {
        @include quotation-marks(en);
      }

      .my-other-class {
        @include quotation-marks(de);
      }
    SCSS
      .my-class:before,
      .my-other-class:after {
        content: "“";
      }

      .my-class:after {
        content: "”";
      }

      .my-other-class:before {
        content: "„";
      }
    CSS
  end

  it 'should use quotation marks per language' do
    assert_sass <<-SCSS, <<-CSS
      @import "quotation-marks";
      .my-class {
        @include localized-quotation-marks(en de);
      }
    SCSS
      .my-class:lang(en):before,
      .my-class:lang(de):after {
        content: "“";
      }

      .my-class:lang(en):after {
        content: "”";
      }

      .my-class:lang(de):before {
        content: "„";
      }
    CSS
  end

end


