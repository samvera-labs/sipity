# Sipity

The Sipity Rails engine (prototype)

The goal of this prototype is to extract the Sipity workflow features from Hyrax so that other services can leverage this workflow service.

### TODO:
We need to figure out how to disentangle PermissionTemplates in Hyrax from Sipity::Workflow. Especially:
  * Workflow#active
  * Workflow.activate!
  * Workflow.find_active_workflow_for
  * Entity#proxy_for

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sipity'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sipity

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/samvera-labs/sipity. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Sipity project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/samvera-labs/sipity/blob/master/CODE_OF_CONDUCT.md).
