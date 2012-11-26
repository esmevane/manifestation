require 'erb'
require 'json'

%w(version content build generate parse template).each do |lib|
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
