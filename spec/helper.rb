require 'minitest/autorun'
require 'manifestation'

def fixture_path string = String.new
  File.expand_path("../fixtures/#{string}", __FILE__)
end

def manifest
  @manifest ||= Manifestation.new fixture_path('manifest.json')
end

def nested_manifest
  @nested_manifest ||= Manifestation.new fixture_path('nested-manifest.json')
end

def manifest_parser
  @manifest_parser ||= Manifestation::Parse.new fixture_path('manifest.json')
end

def non_manifest_parser
  @non_manifest_parser ||=
    Manifestation::Parse.new fixture_path('source/header.md')
end