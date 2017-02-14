# Capistrano::Sunspot

Sunspot specific tasks for Capistrano v3:

  - `cap sunspot:start`
  - `cap sunspot:stop`
  - `cap sunspot:reindex`
  - `cap sunspot:restart`

## Installation

Add these lines to your application's Gemfile:

```ruby
group :development do
  gem 'capistrano'
  gem 'capistrano-sunspot'
end
```

Run the following command to install the gems:

```
bundle install
```

Then run the generator to create a basic set of configuration files:

```
bundle exec cap install
```

## Usage

Require capistrano sunspot :

```ruby
# Capfile
require 'capistrano/capistrano-sunspot'
```


Please note that any `require`s should be placed in `Capfile`, not in `config/deploy.rb`.

You can tweak some Rails-specific options in `config/deploy.rb`:

```ruby



### Symlinks

You'll probably want to symlink sunspot shared files and directories like `solr`.
Make sure you enable it by setting `linked_dirs` and `linked_files` options:

```ruby
# deploy.rb
set :linked_dirs, fetch(:linked_dirs, []).push('solr')

```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
