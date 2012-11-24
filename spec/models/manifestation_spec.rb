require 'helper'

describe Manifestation do
  it "loads files with full paths" do
    manifest.source.wont_be_nil
  end

  it "parses json" do
    manifest.source.must_be_instance_of Hash
  end

  it "records the base path of the manifest" do
    manifest.base_path.must_equal fixture_path
  end

  it "adds the base_path in the manifest to the content_path" do
    path = File.join manifest.base_path, manifest.source['base_path']
    manifest.content_path.must_equal path
  end

  it "finds the target files in the manifest" do
    manifest.content_files.must_be_instance_of Array
  end

  it "composes the output" do
    manifest.compose.must_be_instance_of String
  end

  it "knows the output name" do
    manifest.output.must_be_instance_of String
  end

  it "builds an output file" do
    manifest.build.must_be_instance_of File
  end
end