# Dossier::Display

Dossier Display is a [Dossier](https://github.com/adamhunter/dossier) plugin that 
provides additional functionality for displaying Dossier reports by programatically
declaring css IDs and Classes that will be added to the table's display.

## Usage

### Setting a configuration option
Configurations options can be provided as values or procs.  The values will be
used as appropriate for the data type.  Strings will be output into the dom,
booleans will enable the feature being configured. Symbols will be used as
methods to call on a `Dossier::Display` instance. Procs will be called and
the returned value will be used as if a literal one was given.  The proc may
be passed contextual information such as what value is about to be displayed
or which row is being looped through.  The proc will be evaluated in the
context of an instance of the `Dossier::Display` class an will have access to
the current report through the `report` method.

### Global Display Settings
In the initializer *used for global display settings*

```ruby
# config/initializers/dossier-display.rb
Dossier::Display.configure do |config|
  config.table.class = 'table.table-striped.table-bordered'
  config.table.id    = -> { "table-#{report.name.parameterize}" }
end
```

### Specific Report Display Settings
For an individual report *used to configure display for a single report*

```ruby
# inside of the report you want to customize
class MyReport < Dossier::Report
  # your report code...
  class Display < Dossier::Display
    configure do |config|
      config.table.id = 'table.table-striped.table-customized.table-fancified'
      config.td.style = ->(v, i) { "color:#{color_for_index(i)};" }
      config.hide     = :headers_to_hide
    end
    
    # first two columns should be red
    def color_for_index(i)
      i < 2 ? 'red' : 'auto'
    end

    def headers_to_hide
      %w[id embezzled_amount]
    end
  end
end
```

## Options

All the options available for customizing the display of the report are as follows:

* `table.id`      the id that will be added to the report table tag
* `table.class`   the dom class(es) that will be added to the report table tag
* `table.style`   the style rule that will be added to the report table tag style attribute
* `table.counter` adds an incrementing counter in the first column of every row
* `tr.id`         the id to apply to each tr (proc will be passed the row)
* `tr.class`      the class to apply to each tr (proc will be passed the row)
* `tr.style`      the style rule that will be added to each tr's style attribute (proc will be passed the row)
* `th.id`         the id to apply to each th (proc will be passed the value and its index)
* `th.class`      the class to apply to each th (proc will be passed the value and its index)
* `th.style`      the style rule that will be added to each th's style attribute (proc will be passed the value and its index)
* `td.id`         the id to apply to each td (proc will be passed the value and its index)
* `td.class`      the class to apply to each td (proc will be passed the value and its index)
* `td.style`      the style rule that will be added to each td's style attribute (proc will be passed the value and its index)
* `hide`          this is an array of headers that should not be in the display (the will still be passed to formatters in the row)

## Installation

Add this line to your application's Gemfile:

    gem 'dossier-display'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dossier-display

Then run the initializer

    $ rails g dossier:display

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
