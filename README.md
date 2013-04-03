# NimbuAPI

[![Gem Version](https://badge.fury.io/rb/nimbu-api.png)](http://badge.fury.io/rb/nimbu-api)

A Ruby wrapper for the Nimbu API.

## Installation

Install the gem by issuing

```ruby
gem install nimbu-api
```

or put it in your Gemfile and run `bundle install`

```ruby
gem "nimbu-api"
```

## Usage

To use the gem, create a new client instance

```ruby
nimbu = Nimbu.new
```

You can supply following configuration parameters, such as
```
  auto_pagination  # by default false, set to true traverses requests page links
  oauth_token      # oauth authorization token
  basic_auth       # login:password string
  client_id        # oauth client id
  client_secret    # oauth client secret
  subdomain        # the nimbu administration subdomain used in requets if none provided
  endpoint         # nimbu enterprise api endpoint
  site             # nimbu enterprise api web endpoint
  ssl              # ssl settings
  per_page         # number of items per page, max 100
  user_agent       # custom user agent name, by default 'Nimbu Ruby Client'
```
which are used throughout the API. These can be passed directly as hash options:

```ruby
nimbu = Nimbu.new oauth_token: 'token'
```

Alternatively, you can configure the Nimbu settings by passing a block, for instance, with custom enterprise endpoint and website like

```ruby
nimbu = Nimbu.new do |config|
  config.endpoint    = 'https://api.company.com'
  config.site        = 'https://www.company.com'
  config.oauth_token = 'token'
  config.ssl         = {:verify => false}
end
```

You can authenticate either using OAuth authentication or through basic authentication by passing your login and password:

```ruby
nimbu = Nimbu.new login:'peter', password:'...'
```

or use following convenience method:

```ruby
nimbu = Nimbu.new basic_auth: 'login:password'
```

This gem follows the Nimbu API hierarchy. This means, i.e. if you want to create a new entry for a given channel,
you can lookup the nimbu api spec and parse the request as in `nimbu.channels(channel_id: 'mychannel').entries.create`

The response is always of type [Hashie::Mash] and allows to traverse all the json response attributes like method calls i.e.

```ruby
entries = Nimbu::Channel::Entries.new :oauth_token => '...', :subdomain => '...', :channel_id => '...'
entries.all do |entry|
  puts entry.title
end
```

## Arguments & Parameters

The library allows for flexible arguments parsing. This means arguments can be passed during instance creation:

```ruby
  channel = Nimbu::Channel.new :oauth_token => '...', :subdomain => '...', :channel_id => '...'
  channel.entries.list state: 'public'
```

Further, arguments can be passed directly inside method called but then the order of parameters matters and hence please consult the method documentation or Nimbu specification. For instance:

```ruby
  channel = Nimbu::Channel.new :oauth_token => '...', :subdomain => '...'
  channel.entries.list channel_id: '...', state: 'public'
```

Similarly, the arguments for the request can be passed inside the current scope such as:

```ruby
  channel = Nimbu::Channel.new :oauth_token => '...', :subdomain => '...'
  channel.entries(channel_id: '...').list(state: 'public')
```