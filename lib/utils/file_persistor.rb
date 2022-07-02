# frozen_string_literal: true

module Utils
  class FilePersistor
    def save(path, content)
      File.write(path, content)
    end
  end
end
