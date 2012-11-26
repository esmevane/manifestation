class Manifestation
  class Build

    def initialize generator
      @generator = generator
    end

    def compose
      output_file = new_output
      output_file.write @generator.compose
      output_file.close
      output_file
    end

    private

    def source
      @generator.source
    end

    def new_output
      File.new output, "w+"
    end

    def output
      @output ||= File.join @generator.base_path, source['output']
    end

  end
end