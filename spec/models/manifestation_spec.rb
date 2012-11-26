require 'helper'

describe Manifestation do

  it "builds an output file" do
    manifest.build.must_be_instance_of File
  end

  it "composes the output into a string" do
    manifest.compose.must_be_instance_of String
  end

  it "composes the correct string" do
    manifest.compose.must_match '## Header'
  end

  it "loads files with full paths" do
    manifest.source.wont_be_nil
  end

  it "builds the source information with a json hash" do
    manifest.source.must_be_instance_of Manifestation::Source
  end

  it "recursively builds nested manifests" do
    nested_manifest.compose.must_match "A ruby code snippet"
  end

  it "uses a master template" do
    manifest.compose.must_match '# Manifestation'
  end

end