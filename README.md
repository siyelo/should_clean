# ShouldClean

[![Build Status](https://travis-ci.org/siyelo/should_clean.png)](https://travis-ci.org/siyelo/should_clean)

Clean "should" from test libraries. Example:

    it "should do something"

is replaced with:

    it "does something"

## Installation

    gem install should_clean

## Usage

Search and replace in a directory:

    should_clean -d DIRECTORY

Run in simulator mode (it just prints the changes to the screen)

    should_clean -d DIRECTORY -s

## Related Projects

* [should_not](https://github.com/should-not/should_not): a gem to enforce that specs in RSpec and MiniTest do not begin with "should."

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Make sure all tests pass (`rspec spec/`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
