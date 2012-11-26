class Manifestation
  class Template

    def initialize generator
      @generator = generator
    end

    def source
      @generator.source
    end

    def template_path
      @template_path ||= File.join @generator.base_path, source['base_path'],
        String(source['template'])
    end

    def render_template
      ERB.new(template).result(binding)
    end

    def template
      @template ||= File.read(template_path) rescue blank_template
    end

    def blank_template
      "<%= yield %>"
    end

    def compose
      render_template do
        @generator.joined_contents
      end
    end

  end
end