module RailsRenamer
  class ContentReplacer
    def self.find_and_replace_application_name(file_name, current_name, new_app_name)
      begin
        file_stream = File.open(file_name, 'r+')
      rescue Errno::ENOENT => e
        puts "The specified file does not exist: #{file_name}"
        return
      end

      contents = file_stream.read

      contents.gsub!(current_name, new_app_name)

      File.truncate(file_name, 0)
      file_stream.write(contents)
      file_stream.close
      contents
    end
  end
end
