class Manifestation
  class Build

    def initialize generator
      @generator = generator
    end

    def compose
      output_file = new_output_file
      output_file.write @generator.compose
      output_file.close
      output_file
    end

    def source
      @generator.source
    end

    def new_output_file
      puts output
      File.new output, "w+"
    end

    def output
      @output ||= output_file_path
    end

    def output_file_path
      File.join @generator.base_path, source['output']
    end

  end
end