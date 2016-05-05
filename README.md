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

    gem 'settingify', '0.1.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install settingify -v 0.1.0

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

```ruby
Settingify.prepare_settings do
  setting :some_name, type: SettingType, default: 'some default value'
end
```

Supported types are _String_, _Integer_ and _Float_. But you may define own
convertors. There are 2 conditions for that:

1. Convertor must contains class method `ConvertorClass.try_convert`
2. This method accepts string value

Also exists ability for set type as passing class or simple a symbol.
For example:

```ruby
Settingify.prepare_settings do
  setting :some_name, type: :string, default: 'some default value'
end
```

Default type is __string__.

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

### Syncing settings

When you define settings in initializer this is no effect on DB. But in
most cases you (as site administator) want to change some settings
without redeploy the whole application. For this you may add settings to
the DB manually or run built-in rake task:

```
bundle exec rake settingify:sync
```

### Identifiing settings

For some reason, e.g. in admin panel, you need to list all available
settings. Also you want to provide humanized title and description for
each setting separately. So for this from now `#title` and `#description`
on `Settingify::Setting` exists. They provide localized values which can
be defined using following key structure:

```
settingify.settings.{KEY}.{title/description}
```

### Grouping settings

From _v0.0.4_ you can grouping settings. This feature does not affected
on API for reading setting, so you must to define uniq setting names
even in different groups. Grouping is a quite simple:

```ruby
Settingify.prepare_settings do
  group :amazon_ses do
    setting :amazon_ses_client_id
  end
end
```

By calling `Settingify.groups` you can get all defined groups. For each
group you can get it's `#title` and defined `#settings` in concrete
group. Title is localized and key has the following structure:

```
settingify.groups.{KEY}.title
```

Grouping was coming mainly for to be able to more clear render settings
in admin panel but also with keeping in mind about next enhancements.

## Localization feature

[Read there](https://github.com/alterego-labs/settingify/wiki/Localization-feature)

## Testing

Because localization feature affects on Setting class by unchangable
traco logic includance to run all specs you must run several commands:

```
rspec spec/lib
```

and

```
rspec spec/localized_settingify_spec.rb
```

Or you can run they by single command:

```
rake spec
```

## Contributing

1. Fork it ( https://github.com/alterego-labs/settingify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
