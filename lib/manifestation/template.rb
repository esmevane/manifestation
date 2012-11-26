class Manifestation
  class Template < SimpleDelegator

    def initialize generator
      @generator = generator
      super
    end

    def compose
      render_template do
        Content.new(self).compose
      end
    end

    private

    def path
      @path ||= File.join base_path, source.base_path, template_name
    end

    def template_name
      String source.template
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