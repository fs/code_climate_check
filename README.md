# CodeClimateCheck

[![Build Status](https://travis-ci.org/ildarsafin/code_climate_check.svg?branch=master)](https://travis-ci.org/ildarsafin/code_climate_check)
[![Coverage Status](https://coveralls.io/repos/ildarsafin/code_climate_check/badge.png?branch=master)](https://coveralls.io/r/ildarsafin/code_climate_check?branch=master)

Gem that allows You to check your code quality with CodeClimate right from your console

## Installation

Add this line to your application's Gemfile:

    $ gem 'code_climate_check'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install code_climate_check

If you cloned this project use:

    $ bin/bootstrap

## Usage

Just type in your console:

    code_climate_check %your-codeclimate-token% %your-repo-id% %your-branch-name%

## Quality tools

* `bin/quality` based on [RuboCop](https://github.com/bbatsov/rubocop)
* `.rubocop.yml` describes active checks

## Develop

`bin/build` checks your specs and runs quality tools

## Contributing

1. Fork it ( https://github.com/[my-github-username]/code_climate_check/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits

CodeClimateCheck is maintained by [Timur Vafin](http://github.com/timurvafin) and [Ildar Safin](http://github.com/ildarsafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/code_climate_check/contributors).


[![Flatstack](http://www.flatstack.com/assets/images/logo.png)](http://www.flatstack.com)
