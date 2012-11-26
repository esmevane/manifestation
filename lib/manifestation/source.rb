class Manifestation
  class Source < OpenStruct

    def initialize file
      super JSON.parse File.read file
    end

  end
end