# Settingify

This is small global settings system with some features:

1. Works without table returning default values. Migrating db loaded the whole rails environment
   and using settings in lazy code blocks (like activeadmin resource
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
Settingify.prepare_settings do
  setting :some_name, type: SettingType, default: 'some default value'
end
```

Supported types are _String_, _Integer_ and _Float_. But you may define own
convertors. There are 2 conditions for that:

1. Convertor must contains class method `ConvertorClass.try_convert`
2. This method accepts string value

### Reading settings

There are two cases:

1. Setting table is not exists - the default value will be returned.
2. Setting table is exists - value from record will be returned.
3. Setting table is exists and record not found - the default value will
   be returned too.

According to example above to read setting use the next code:

```
Settingify.some_name
```

## Contributing

1. Fork it ( https://github.com/alterego-labs/settingify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
