# NobleNames

A small Gem to capitalize names with regard to nobility particles.

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
"james of windsor".to_title #=> "James of Windsor"
"joseph von und zu reinbeck".to_title #=> "Joseph von und zu Reinbeck"
```
you can also use the bang method:
```ruby
my_string = "joseph von und zu reinbeck"
my_string.to_title!
my_string                                 #=> "Joseph von und zu Reinbeck"
```

### Languages
So far only English and German are supported.
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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

To add more particles from other languages, just add them to the
`data/particles.yml` file.
Bug reports and pull requests are welcome on GitHub at https://github.com/Haniyya/noble_names.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

