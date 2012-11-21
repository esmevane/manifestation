require 'minitest/autorun'
require 'manifestation'

def fixture_path string = String.new
  File.expand_path("../fixtures/#{string}", __FILE__)
end

def manifest
  @manifest ||= Manifestation.new fixture_path('manifest.json')
end