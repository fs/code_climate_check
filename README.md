# CodeClimate CLI

[<img src="https://semaphoreapp.com/api/v1/projects/0df9c322-30ce-4385-b060-6ad8a4bf69bb/212505/badge.png">](https://semaphoreapp.com/fs/code_climate_check)
[![Code Climate](https://codeclimate.com/github/fs/code_climate_check.png)](https://codeclimate.com/github/fs/code_climate_check)

Gem that allows You to check your code quality with CodeClimate right from your console

## Installation

Add this line to your application's Gemfile:

    $ gem 'codeclimate-cli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codeclimate-cli

If you cloned this project use:

    $ bin/bootstrap

## Usage

Just type in your console:

    $ codeclimate-cli --token=CODECLIMATE_API_TOKEN --repository=REPOSITORY_ID --branch=BRANCH

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
