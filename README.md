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

### Defining settings

It may be done by patching created initializer in
`config/initializers/settingify.rb`. There is simple DSL:

```
Settingify.setup do
  setting :some_name, type: SettingType, default: 'some default value'
end
```

Supported types are _String_ and _Integer_.

### Reading settings

There are two cases:

1. Setting table is not exists
2. Setting table is exists

In first case when you requests some setting the default value will be
returned.
If table is exists request to DB will be done. Value from record will be
returned if it found and default value in another case.
When trying to request undefined setting exception will be throwed.


## Contributing

1. Fork it ( https://github.com/alterego-labs/settingify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
