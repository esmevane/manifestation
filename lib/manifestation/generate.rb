require 'erb'

class Manifestation
  class Generate
    attr_accessor :source

    def initialize file
      @file   = file
      @source = build_source @file
    end

    def compose
      render_template do
        contents.join "\n\n"
      end
    end

    def build
      output_file = new_output_file
      output_file.write compose
      output_file.close
      output_file
    end

    private

    def render_template
      ERB.new(template).result(binding)
    end

    def template
      @template ||= File.read(template_path) rescue blank_template
    end

    def blank_template
      "<%= yield %>"
    end

    def template_path
      @template_path ||= File.join content_path, source['template']
    end

    def base_path
      @base_path ||= File.expand_path "..", @file
    end

    def content_path
      @content_path ||= File.join base_path, source['base_path']
    end

    def content_files
      @content_files ||= Array @source['contents']
    end

    def contents
      @contents ||= content_files.map do |filename|
        parse File.join(content_path, filename)
      end
    end

    def output
      @output ||= output_file_path
    end

    def output_file_path
      File.join base_path, source['output']
    end

    def new_output_file
      File.new output, "w+"
    end

    def parse file
      Parse.new(file).compose
    end

    def build_source file = @file
      JSON.parse File.read file
    end

  end
end