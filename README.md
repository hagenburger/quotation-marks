# Quotation Marks

An easy to use mixin for quotation marks in Sass


## Usage


### Add quotation marks to an element

``` scss
@import "quotation-marks";

.my-class {
  @include quotation-marks(en);
}
```

``` css
/* RESULT */

.my-class:before {
  content: "“";
}

.my-class:after {
  content: "”";
}
```


### Use :lang()

``` html
<html lang="de">
  <body>
    <div class="my-class">Hello World!</div>
  </body>
</html>
```

``` scss
@import "quotation-marks";

.my-class {
  @include localized-quotation-marks(en de);
}
```

``` css
/* RESULT */

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
```

**Notice:** This gem uses `%placeholders`—so it combines all similar
quotation mark and just adds the selectors.


## Installation

Add this line to your application’s Gemfile:

    gem 'quotation-marks'

And then execute:

    bundle

Or install it yourself as:

    gem install quotation-marks


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Copyright

Copyright (c) 2014 [Nico Hagenburger](http://www.hagenburger.net).
See [MIT-LICENSE.md](MIT-LICENSE.md) for details.
Get in touch with [@hagenburger](http://twitter.com/hagenburger) on Twitter.
