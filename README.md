# Multibanco Ifthenpay Gem

[![Gem Version](https://badge.fury.io/rb/multibanco_ifthenpay.svg)](https://badge.fury.io/rb/multibanco_ifthenpay)
[![Build Status](https://travis-ci.org/rafaelcpalmeida/multibanco_ifthenpay.svg?branch=master)](https://travis-ci.org/rafaelcpalmeida/multibanco_ifthenpay)
[![Coverage Status](https://coveralls.io/repos/github/rafaelcpalmeida/multibanco_ifthenpay/badge.svg?branch=master)](https://coveralls.io/github/rafaelcpalmeida/multibanco_ifthenpay?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/ea8d1dd7e3ca818b621d/maintainability)](https://codeclimate.com/github/rafaelcpalmeida/multibanco_ifthenpay/maintainability)

Multibanco is a Portuguese payment method that allows the customer to pay by bank reference. This gem aims to provide a simple way to integrate Ifthenpay's multibanco gateway into your Ruby / Ruby on Rails projects.

Ifthenpay is the provider of the service and a contract with this company is required. See more at [Ifthenpay](https://ifthenpay.com). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multibanco_ifthenpay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multibanco_ifthenpay

## Usage
After you sign a contract with [Ifthenpay](https://ifthenpay.com) all you have to do is create a new object using the provided entity and sub-entity, an order id and it's value.

You can use the code as the example below:

```ruby
#!/usr/bin/ruby

require 'multibanco_ifthenpay'

multibanco = MultibancoIfthenpay::Multibanco.new('99999', '999', '1', 15)

puts "Entity: #{multibanco.entity}"
# Prettify parameter is optional. If you set it as false or omit it, it won't place a blank space between each 3 characters.
puts "Sub-entity: #{multibanco.print_multibanco_reference(prettify: true)}"
puts "Value: #{multibanco.order_value}€"
```

The result for the code above is:

```
Entity: 99999
Sub-entity: 999 000 139
Value: 15€
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rafaelcpalmeida/multibanco_ifthenpay. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MultibancoIfthenpay project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rafaelcpalmeida/multibanco_ifthenpay/blob/master/CODE_OF_CONDUCT.md).
