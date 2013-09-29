# RailsRenamer

A gem to help you rename your Rails application after creating it. 

## Installation

Add this line to your application's Gemfile:

    gem 'rails_renamer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_renamer

## Usage

The easiest way to use the gem is to do the following:

1. Add it to your application's Gemfile.
2. Open the Rails console (rails c).
3. Run the following command: `RailsRenamer.rename_current_application('./', new_application_name)` where `new_application_name` is your new desired app name.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
