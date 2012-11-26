class Manifestation
  class Template

    def initialize generator
      @generator = generator
    end

    def compose
      render_template do
        Content.new(@generator).compose
      end
    end

    private

    def source
      @generator.source
    end

    def path
      @path ||= File.join @generator.base_path, source['base_path'],
        String(source['template'])
    end

    def render_template
      ERB.new(template).result(binding)
    end

    def template
      @template ||= File.read(path) rescue blank_template
    end

    def blank_template
      "<%= yield %>"
    end

  end
end