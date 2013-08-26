A Ruby wrapper for the [Softers](http://www.softers.net/) SMS API
=======================================================
[![Build Status](https://travis-ci.org/nevalla/softers.png?branch=master)](https://travis-ci.org/nevalla/softers)
## Installation

Add this line to your application's Gemfile:

    gem 'softers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install softers

## Usage

Construct a client object with your Softers API credentials:

    softers = Softers::Client.new('...username...', '...password...')
    softers.send_message({to_phone: '+3585551144', message: 'Hey!'})



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
