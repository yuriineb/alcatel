# Alcatel

This gem for easy communication with Alcatel-Lucent 7302 devices. It currently allows you to execute commands on a device.

## Installation

Add this line to your application's Gemfile:

    gem 'alcatel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alcatel

## Usage

a = Alcatel::Session.new(:host => 'hostname', :user => 'username', :password => 'password', :debug => true|false)
a.disable_igmp(rack, shelf, slot, port, vpi, vci)
a.enable_igmp(rack, shelf, slot, port, vpi, vci)
a.cmd('custom command')
a.logout

## Contributing

1. Fork it ( https://github.com/[my-github-username]/alcatel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
