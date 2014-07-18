# Code Climate Ci

[<img src="https://semaphoreapp.com/api/v1/projects/67b7f0f3-e224-43a2-afd9-b24c5176e6dd/214701/badge.png">](https://semaphoreapp.com/fs/codeclimate_ci)
[![Code Climate](https://codeclimate.com/github/fs/codeclimate_ci.png)](https://codeclimate.com/github/fs/codeclimate_ci)

Gem that allows You to check your code quality with CodeClimate right from your console

## Installation

Add this line to your application's Gemfile:

    $ gem 'codeclimate_ci'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codeclimate_ci

If you cloned this project use:

    $ bin/bootstrap

## Usage

Just type in your console:

    $ codeclimate_ci --codeclimate-api-token=CODECLIMATE_API_TOKEN --repo-id=REPOSITORY_ID --branch=BRANCH

## Quality tools

* `bin/quality` based on [RuboCop](https://github.com/bbatsov/rubocop)
* `.rubocop.yml` describes active checks

## Develop

`bin/build` checks your specs and runs quality tools

## Contributing

1. Fork it ( https://github.com/[my-github-username]/codeclimate_ci/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits

CodeClimateCheck is maintained by [Timur Vafin](http://github.com/timurvafin) and [Ildar Safin](http://github.com/ildarsafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/codeclimate_ci/contributors).


[![Flatstack](http://www.flatstack.com/assets/images/logo.png)](http://www.flatstack.com)
