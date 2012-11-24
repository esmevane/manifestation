require 'helper'

describe Manifestation::Parse do
  
  it "recognizes manifest files" do
    manifest_parser.is_manifest?.must_equal true
  end

  it "returns a rendered result of manifest files" do
    manifest_parser.compose.must_match '### Footer information'
  end

  it "returns the file contents of non-manifest files" do
    non_manifest_parser.compose.must_match '# Header'
  end
end