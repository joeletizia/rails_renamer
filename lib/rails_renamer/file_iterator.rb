module RailsRenamer
  class FileIterator
    def initialize(file_repository, new_app_name)
      @file_repository = file_repository
      @new_app_name = new_app_name
    end

    def parse_all
      @file_repository.files_to_rename.each do |file|
        RailsRenamer::ContentReplacer.find_and_replace_application_name(file, @new_app_name)
      end
    end
  end
end
