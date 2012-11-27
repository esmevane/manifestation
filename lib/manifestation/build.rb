class Manifestation
  class Build < SimpleDelegator

    def compose
      output_file = new_output
      output_file.write __getobj__.compose
      output_file.close
      output_file
    end

    private

    def new_output
      File.new output, "w+"
    end

    def output
      File.join root_path, source.output
    end

  end
end