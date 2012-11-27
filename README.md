# Manifestation

A simple tool to neatly collate files into one output, guided by specifically formatted manifest.json files.

## Installation

Add this line to your application's Gemfile:

    gem 'manifestation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install manifestation

## Usage (Ruby)

### A basic manifest

First, create three template files:

#### header.md

```
# A header file
```

#### body.md

```
## Body file

This is a nice little body file.
```

#### footer.md

```
### Footer information
```

Then, in the same directory, make a file ending in "manifest.json", containing a JSON hash which looks like this:

```json
{
  "output":   "readme.md",
  "contents": [ "header.md", "body.md", "footer.md" ]
}
```

This is a basic manifest, containing only the bare minimum of information Manifestation looks for.  This manifest tells Manifestation to take the header.md, body.md and footer.md files in that order, and collate them into a readme.md.

Then in console:

```ruby

require 'manifestation'

manifest = Manifestation.new "/path/to/manifest.json"

# This will return a string 
manifest.compose

# This will build a readme.md, overwriting any previous versions of the file
manifest.build
```

Manifestation has taken the three files and put them together, placing a readme.md file in the same directory.  Any time you need to update the readme.md, you can just rebuild from the manifest in the above way.

### Other manifest abilities

#### Templates

Manifestation understands ERB, and it can wrap output in templates which use it.

Let's say you have a template.md.erb file which looks like this:

```
# The readme template

<%= yield %>
```

You could point to it in your manifest using the template directive, like this:

```json
{
  "template":   "template.md.erb",
  "output":     "readme.md",
  "contents":   [ "header.md", "body.md", "footer.md" ]
}
```

And the readme.md output would be wrapped in your template.

#### Base paths

If you want more organization for your templates, you can always point to a directory using the base_path directive, which takes a relative path, like so:

```json
{
  "base_path":  "source",
  "output":     "readme.md",
  "contents":   [ "header.md", "body.md", "footer.md" ]
}
```

This tells Manifestation to look in the source/ directory to find the contents of readme.md.

#### Nested manifests

Manifestation is able to recursively build manifests.  This means that if you reference a manifest file within the contents file of another manifest, the output of the nested manifest stands in for the given manifest.

For example, this manifest.json points towards a body-manifest.json instead of a body.md file:

```json
{
  "output":     "readme.md",
  "contents":   [ "header.md", "body-manifest.json", "footer.md" ]
}
```

The body-manifest.json file looks like this:

```json
{
  "contents":   [ "body-header.md", "code-snippet.md" ]
}
```

The body-manifest.json file will collate the body-header.md and code-snippet.md files together, and then those contents will travel upstream to stand between the header.md and footer.md sections of the readme.md output.

Did you notice the absence of the "output" directive?  That's because nested manifests don't need the output directive, it's not necessary when there is no implicit output, only when used in isolation.  Manifestation automatically knows where the output belongs, and will place it all logically in the parent readme.md file.

If you intend to ever use the nested manifest in isolation, you can easily include the output directive and it will become a fully-functional manifest file.

Nested manifests work just like regular manifests in every other way, including the ability to use base_path and template directives.

### Some other things about Manifestation

* It uses only Ruby standard library features - there are no non-standard dependencies.
* It does not perform any interpretation of the files other than ERB in the templates.  It just collates.
* It was fully built with MRI 1.9.3 and is entirely untested on previous versions.

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