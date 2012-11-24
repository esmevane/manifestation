require 'helper'

describe Manifestation do

  it "builds an output file" do
    manifest.build.must_be_instance_of File
  end

  it "composes the output into a string" do
    manifest.compose.must_be_instance_of String
  end

  it "composes the correct string" do
    manifest.compose.must_match '# Header'
  end

  it "loads files with full paths" do
    manifest.source.wont_be_nil
  end

  it "parses json" do
    manifest.source.must_be_instance_of Hash
  end

  it "recursively builds nested manifests" do
    nested_manifest.compose.must_match "A ruby code snippet"
  end

  # TODO: Tests to write:
  # it "wraps specified manifest files in templates"
  # it "takes a master template"

end