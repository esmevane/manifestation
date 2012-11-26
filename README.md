# Manifestation

A simple tool to neatly collate files into one output, guided by manifests.

## Installation

Add this line to your application's Gemfile:

    gem 'manifestation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install manifestation

## Usage (Ruby)

Make a file ending in "manifest.json", containing a JSON hash which looks like this:

```json
{
  "output":   "readme.md",
  "contents": [ "header.md", "body.md", "footer.md" ]
}
```

Then in console:

```ruby

require 'manifestation'

manifest = Manifestation.new "/path/to/manifest.json"

# This will return a string 
manifest.compose

# This will build a readme.md, overwriting any previous versions of the file
manifest.build
```

### Some nice things about Manifestation

* It can nest manifests
* Manifests can have templates
* Manifests can be named anything ending with "manifest.json"
* You can point manifests at other directories
* It uses only Ruby standard library features

### Some not-so-nice things about Manifestation

* Only built and tested on 1.9.3 and is almost guaranteed not to work on previous versions

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Todos before first stable

* Move most generator content back into base manifestation class
* Create 'manifest' executable script to go with gem
* Unite root_path invocation in generator class
* Attempt to decouple generator and place that responsibility in base class
* Gracefully fail to build on no output file?  Or default file?

## Todos after first stable, before release

* Document code
* Unit test each class in isolation
* Unit test central script executable

## One day

* Handle different manifest types - YAML, for instance