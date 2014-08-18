# Code Climate CI

[<img src="https://semaphoreapp.com/api/v1/projects/67b7f0f3-e224-43a2-afd9-b24c5176e6dd/214701/shields_badge.png">](https://semaphoreapp.com/fs/codeclimate_ci)
[![Code Climate](https://codeclimate.com/github/fs/codeclimate_ci.png)](https://codeclimate.com/github/fs/codeclimate_ci)
[![Test Coverage](https://codeclimate.com/github/fs/codeclimate_ci/badges/coverage.svg)](https://codeclimate.com/github/fs/codeclimate_ci)

The main idea of the Code Climate CI gem is that you can implement it to your ci script. Gem will compare code quality in current branch with master branch through CodeClimate API and if code in your branch become worse then ci script will be interrupted.

You can also compare code quality in your branch using this gem right from your console.

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

```shell
  $ codeclimate_ci --codeclimate-api-token CODECLIMATE_API_TOKEN --repo-id REPOSITORY_ID --branch_name BRANCH
```

  * For codeclimate api token you need to go to codeclimate account settings in `Integrations` tab and there you can see `API Token`.
  * For repo id you need to go to your private repo and then you'll see it in you address string.

## Response examples
  * If you entered wrong api-token or repo-id response will be:
```shell
  $ Invalid credentials given. Please check your codeclimate_api_token and repo_id.
```
  * If GPA in your branch became worse than in master response will be:
```shell
  $ Code in your branch became worse on %diff_point% points
```
  * If GPA in your branch became better than in master response will be:
```shell
  $ Gpa score has improved to %diff_point% points. Go on...
```

## Quality tools

* `bin/quality` based on [RuboCop](https://github.com/bbatsov/rubocop)
* `.rubocop.yml` describes active checks

## Development

`bin/build` checks your specs and runs quality tools

## Contributing

1. Fork it ( https://github.com/[my-github-username]/codeclimate_ci/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits

Code Climate CI is maintained by [Ildar Safin](http://github.com/ildarsafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/codeclimate_ci/contributors).


[![Flatstack](http://www.flatstack.com/assets/images/logo.png)](http://www.flatstack.com)
