module RailsRenamer
  class ContentReplacer
    def self.find_and_replace_application_name(file_name, new_app_name)
      current_name = RailsRenamer::ApplicationFileParser.application_name

      file_stream = File.open(file_name, 'r+')
      contents = file_stream.read

      contents.gsub!(current_name, new_app_name)

      file_stream.write(contents)
      file_stream.close
      contents
    end
  end
end
