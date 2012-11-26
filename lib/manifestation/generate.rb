class Manifestation
  class Generate
    
    attr_accessor :source

    def initialize file
      @file   = file
      @source = read_source @file
    end

    def compose
      Template.new(self).compose
    end

    def base_path
      @base_path ||= File.expand_path "..", @file
    end

    private

    def read_source file = @file
      JSON.parse File.read file
    end

  end
end