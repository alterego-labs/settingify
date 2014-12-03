# Settingify

This is small global settings system with some features:

1. Works without table returning default values. Migrating db loaded the whole rails environment
   and using settings in loaded code blocks (like activeadmin resource
   files) may cause problems.
2. May works with admin systems like simple model. For example,
   integration with active admin:

```
rails g active_admin:resource Settingify::Setting
```

## Installation

Add this line to your application's Gemfile:

    gem 'settingify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install settingify

### Post installation

Run intallation generator for installing migration and initializer:

```
rails g settingify:install
```

Then migrate:

```
rake db:migrate
```

## Usage


## Contributing

1. Fork it ( https://github.com/alterego-labs/settingify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
