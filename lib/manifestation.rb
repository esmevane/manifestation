[ 'version', 'generate', 'parse', 'template' ].each do |lib|
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
    @generator.build
  end
end
