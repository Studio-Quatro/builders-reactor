# frozen_string_literal: true

module Utils
  # Class to save a file in temp folder
  class FilePersistor
    def save(filename, content)
      path = Rails.root.join("tmp/#{filename}")
      File.write(path, content)
    end
  end
end
