module RailsRenamer
  class OriginalNameLocator
    def self.original_name(application_root)
      app_file = application_root + RailsRenamer::FileRepository.application_file

      parser = ApplicationFileParser.new(app_file)

      parser.application_name
    end
  end
end
