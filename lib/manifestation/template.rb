class Manifestation
  class Template < SimpleDelegator

    def compose
      render_template do
        Content.new(self).compose
      end
    end

    private

    def path
      File.join root_path, source.base_path, template_name
    end

    def template_name
      String source.template
    end

    def render_template
      ERB.new(template).result(binding)
    end

    def template
      File.read(path) rescue blank_template
    end

    def blank_template
      "<%= yield %>"
    end

  end
end