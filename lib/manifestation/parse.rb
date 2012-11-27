class Manifestation
  class Parse

    def initialize file
      @file = file
    end

    def is_manifest?
      @file.include? "manifest.json"
    end

    def compose
      if is_manifest?
        Manifestation.new(@file).compose
      else
        File.read @file
      end
    end

  end
end