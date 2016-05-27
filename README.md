# NobleNames
[![Build Status](https://travis-ci.org/Haniyya/noble_names.svg?branch=master)](https://travis-ci.org/Haniyya/noble_names)

A small Gem to capitalize names with regard to nobility particles and prefixes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'noble_names'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install noble_names

## Usage

Just
```ruby
require 'noble_names'
```
and use `String#to_title` to correctly format your names.
```ruby
"james of windsor".to_title           #=> "James of Windsor"
"joseph von und zu reinbeck".to_title #=> "Joseph von und zu Reinbeck"
"tywin mclannister".to_title          #=> "Tywin McLannister"
```
you can also use the bang method:
```ruby
my_string = "joseph von und zu reinbeck"
my_string.to_title!
my_string                             #=> "Joseph von und zu Reinbeck"
```

### Languages
So far English, German, French, Spanish, Dutch and Portuguese are supported.
By default all available languages are used. If you want to configure which one
to use for your application, you can do it like so:
```ruby
NobleNames.configure do |config|
  config.languages = [:english,:spanish]
end
```
This way other language particles will be ignored.
```ruby
"joseph von und zu reinbeck".to_title #=> "Joseph Von Und Zu Reinbeck"
```

### Business Names
The current stance on business names is to only correct the business particle
if need be and to leave the rest of the name alone.
```ruby
"bauhelm co. kg".to_title            #=> "bauhelm Co. KG"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

## Contributing
- Fork it ( https://github.com/Haniyya/noble_names/fork )
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Add some feature')
- Push to the branch (git push origin my-new-feature)
- Create a new Pull Request

To add more particles or prefixes from other languages, just add them to the
`data/particles.yml` or `data/prefixes.yml` file respectively.

## Compatability
This gem has no runtime-dependencies outside of the standard library and is
therefore compatible with the following ruby versions:

- jruby
- 2.3.0
- 2.2.4
- 2.2.1
- 1.9.3

Other verions might work to but are not tested in ci so far.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

