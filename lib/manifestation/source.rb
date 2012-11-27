class Manifestation
  class Source < OpenStruct

    # Public: Build an OpenStruct from a JSON file.  This method accepts an
    # absolute path, reads the file at the path, parses with JSON, and then
    # passes the resulting hash upstream to the OpenStruct initializer.
    #
    # Ideally, this thing will raise an error if it can't find the file, or
    # if the file is invalid JSON.  Those exceptions are considered ideal.
    #
    # file - Absolute path to a JSON file.
    def initialize file
      super JSON.parse File.read file
    end

  end
end