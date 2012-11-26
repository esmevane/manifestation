require 'delegate'
require 'erb'
require 'json'
require 'ostruct'

%w(build content generate parse source template version).each do |lib|
  require File.join File.expand_path("./lib"), "manifestation/#{lib}"
end

class Manifestation

  def initialize file
    @generator = Generate.new file
  end

  def source
    @generator.source
  end

  def compose
    @generator.compose
  end

  def build
    Build.new(@generator).compose
  end

end
