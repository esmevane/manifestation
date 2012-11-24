require 'helper'

describe Manifestation do

  it "builds an output file" do
    manifest.build.must_be_instance_of File
  end

  it "composes the output" do
    manifest.compose.must_be_instance_of String
  end

  it "loads files with full paths" do
    manifest.source.wont_be_nil
  end

  it "parses json" do
    manifest.source.must_be_instance_of Hash
  end

end