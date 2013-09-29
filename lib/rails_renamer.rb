require "rails_renamer/version"
require 'rails_renamer/original_name_locator'
require "rails_renamer/application_file_parser"
require 'rails_renamer/file_repository'
require 'rails_renamer/file_iterator'
require 'rails_renamer/content_replacer'

module RailsRenamer
  def self.rename_current_application(application_root, new_app_name)
    application_file = application_root + RailsRenamer::FileRepository.application_file
    current_name = RailsRenamer::ApplicationFileParser.new(application_file).application_name

    FileRepository.files_to_rename.each do |file_name|
      full_file_path = application_root + file_name
      ContentReplacer.find_and_replace_application_name(full_file_path, current_name, new_app_name)
    end
  end
end

