module Utils
  class FilePersistor
    def save(path, content)
      File.open(path, "w+") do |f|
        f.write(content)
      end
    end
  end
end
