class Manifestation
  class Generate
    
    attr_accessor :source

    def initialize file
      @file   = file
      @source = build_source @file
    end

    def compose
      Template.new(self).compose
    end

    def base_path
      @base_path ||= File.expand_path "..", @file
    end

    private

    def build_source file = @file
      Source.new file
    end

  end
end