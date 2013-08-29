A Ruby wrapper for the [Softers](http://www.softers.net/) SMS API
=======================================================
[![Build Status](https://travis-ci.org/nevalla/softers.png?branch=master)](https://travis-ci.org/nevalla/softers-sms)
## Installation

Add this line to your application's Gemfile:

    gem 'softers-sms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install softers-sms

## Usage

Construct a client object with your Softers API credentials:

    @client = SoftersSms::Client.new('...username...', '...password...')
    @client.send_message({to_phone: '+3585551144', message: 'Hey!'})



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Credits

This gem is influenced by [Nexmo](https://github.com/timcraft/nexmo) gem, originally by Tim Craft