require 'erb'

class Manifestation
  class Generate
    attr_accessor :source

    def initialize file
      @file   = file
      @source = build_source @file
    end

    def compose
      template joined_contents
    end

    def base_path
      @base_path ||= File.expand_path "..", @file
    end

    private

    def joined_contents
      contents.join "\n\n"
    end

    def template body
      Template.new(template_path, body).compose
    end

    def template_path
      @template_path ||= File.join content_path, String(source['template'])
    end

    def content_path
      @content_path ||= File.join base_path, source['base_path']
    end

    def content_files
      @content_files ||= Array source['contents']
    end

    def contents
      @contents ||= content_files.map do |filename|
        parse File.join(content_path, filename)
      end
    end

    def parse file
      Parse.new(file).compose
    end

    def build_source file = @file
      JSON.parse File.read file
    end

  end
end