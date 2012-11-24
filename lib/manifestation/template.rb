class Manifestation
  class Template
    def initialize template_path, body
      @template_path = template_path
      @body          = body
    end

    def render_template
      ERB.new(template).result(binding)
    end

    def template
      @template ||= File.read(@template_path) rescue blank_template
    end

    def blank_template
      "<%= yield %>"
    end

    def compose
      render_template do
        @body
      end
    end

  end
end