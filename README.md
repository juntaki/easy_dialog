# EasyDialog

Easy CLI dialog

## Sample

    EasyDialog::Choises.new("Question?", ["Answer1","Answer2","Answer3"]).ask # => "Answer1"
    EasyDialog::Checkbox.new("Question?", ["Answer1","Answer2","Answer3"]).ask # => ["Answer1","Answer3"]


## Installation

Add this line to your application's Gemfile:

    gem 'easy_dialog'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_dialog

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
