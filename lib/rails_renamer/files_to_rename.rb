module RailsRenamer
  class FileRepository
    FILES_TO_RENAME = ['config/application.rb',
                       'config/environment.rb',
                       'config/environments/development.rb',
                       'config/environments/production.rb',
                       'config/environments/test.rb',
                       'config/initializers/secret_token.rb',
                       'config/initializers/session_store.rb',
                       'config/mongoid.yml',
                       'config/routes.rb',
                       'config.ru',
                       'Rakefile',
                       'app/views/layouts/application.html.erb']

    def self.files_to_rename
      FILES_TO_RENAME
    end

    def self.application_file
      'config/application.rb'
    end
  end
end
