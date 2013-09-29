module RailsRenamer
  class ContentReplacer
    def self.find_and_replace_application_name(file_name, current_name, new_app_name)
      begin
        file_stream = File.open(file_name, 'r')
      rescue Errno::ENOENT
        puts "The specified file does not exist: #{file_name}"
        return
      end

      contents = file_stream.read
      contents.gsub!(current_name, new_app_name)

      File.delete(file_name)
      write_new_file(file_name, contents)
      contents
    end

    private

    def self.write_new_file(file_name, contents)
      file_stream = File.open(file_name, 'w')
      file_stream.write(contents)
      file_stream.close
    end
  end
end
