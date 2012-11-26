class Manifestation
  class Build < SimpleDelegator

    def initialize generator
      @generator = generator
      super
    end

    def compose
      output_file = new_output
      output_file.write @generator.compose
      output_file.close
      output_file
    end

    private

    def new_output
      File.new output, "w+"
    end

    def output
      @output ||= File.join root_path, source.output
    end

  end
end