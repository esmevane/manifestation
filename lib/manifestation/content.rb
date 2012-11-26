class Manifestation
  class Content

    def initialize generator
      @generator = generator
    end

    def compose
      parsed_files.join "\n\n"
    end

    private

    def path
      @path ||= File.join @generator.base_path, source['base_path']
    end

    def files
      @files ||= Array source['contents']
    end

    def parsed_files
      @parsed_files ||= files.map do |filename|
        parse File.join(path, filename)
      end
    end

    def source
      @generator.source
    end

    def parse file
      Parse.new(file).compose
    end

  end
end