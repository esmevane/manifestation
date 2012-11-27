class Manifestation
  class Content < SimpleDelegator

    def compose
      parsed_files.join "\n\n"
    end

    private

    def path
      File.join root_path, source.base_path
    end

    def files
      Array source.contents
    end

    def parsed_files
      files.map do |filename|
        parse File.join(path, filename)
      end
    end

    def parse file
      Parse.new(file).compose
    end

  end
end