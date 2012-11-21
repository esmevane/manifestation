require 'json'
require "manifestation/version"

class Manifestation
  attr_accessor :source
  def initialize file
    @file   = file
    @source = parse @file
  end

  def base_path
    @base_path ||= File.expand_path "..", @file
  end

  def content_path
    @content_path ||= File.join base_path, source['base_path']
  end

  def content_files
    @content_files ||= Array @source['contents']
  end

  def contents
    @contents ||= content_files.map do |filename|
      File.read File.join(content_path, filename)
    end
  end

  def compose
    contents.join "\n"
  end

  private

  def parse file = @file
    JSON.parse File.read file
  end
end
