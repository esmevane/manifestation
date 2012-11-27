require 'delegate'
require 'erb'
require 'json'
require 'ostruct'

%w(build content parse source template version).each do |lib|
  require File.join File.expand_path("./lib"), "manifestation/#{lib}"
end

class Manifestation

  def initialize file
    @file = file
  end

  def source
    @source ||= Source.new @file
  end

  def root_path
    File.expand_path "..", @file
  end

  def compose
    Template.new(self).compose
  end

  def build
    Build.new(self).compose
  end

end
