module RailsRenamer
  class OriginalNameLocator
    def self.original_name
      app_file = RailsRenamer::FileRepository.application_file

      parser = ApplicationFileParser.new(app_file)

      parser.application_name
    end
  end
end
