module RailsRenamer
  class ApplicationFileParser
    def initialize(application_file_name)
      @application_file_name = application_file_name
    end

    def application_name
      file = File.open(@application_file_name, "r")
      contents = file.read

      module_string = contents[/module .*$/]
      module_name = module_string.gsub('module ', '')
    end
  end
end
