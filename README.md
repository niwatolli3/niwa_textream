# NiwaTextream

[![Build Status](https://travis-ci.org/niwatolli3/niwa_textream.svg?branch=master)](https://travis-ci.org/niwatolli3/niwa_textream)
[![Code Climate](https://codeclimate.com/github/niwatolli3/niwa_textream/badges/gpa.svg)](https://codeclimate.com/github/niwatolli3/niwa_textream)
[![Test Coverage](https://codeclimate.com/github/niwatolli3/niwa_textream/badges/coverage.svg)](https://codeclimate.com/github/niwatolli3/niwa_textream/coverage)
[![Issue Count](https://codeclimate.com/github/niwatolli3/niwa_textream/badges/issue_count.svg)](https://codeclimate.com/github/niwatolli3/niwa_textream)

NiwaTextream is a scraping library for Yahoo! Textream.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'niwa_textream'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install niwa_textream

## Usage

This gem is following Page Object Pattern.

Get category list displayed on top page
```ruby
mecha = Mechanize.new
NiwaTextream::TopPage.goTo(mecha)
@topPage = NiwaTextream::TopPage.new(mecha)
print(@topPage.categories)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/niwatolli3/niwa_textream. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

