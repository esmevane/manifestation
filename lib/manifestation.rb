require 'delegate'
require 'erb'
require 'json'
require 'ostruct'

%w(version build content generate parse source template).each do |lib|
  require "manifestation/#{lib}"
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
