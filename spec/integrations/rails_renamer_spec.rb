require 'spec_helper'

describe "RailsRenamer" do
  let(:files_to_check) { ['config/application.rb',
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
  }

  after do
    replace_test_rails_application
  end

  it "renames the classes and references in a rails application" do
    application_root = 'spec/integrations/test_rails_app/'
    new_application_name = 'NewApplication'

    RailsRenamer.rename_current_application(application_root, new_application_name)

    files_to_check.each do |file_name|
      begin
        file_contents = File.open("#{Dir.pwd + '/'}#{application_root}#{file_name}", 'r').read
      rescue Errno::ENOENT => e
        puts "Skipping unused file: #{file_name}"
        next
      end

      file_contents.should be
      file_contents.should_not include("DefaultApp")
    end
  end

  def replace_test_rails_application
    `rm -rf spec/integrations/test_rails_app`
    `cp -r spec/integrations/original_rails_app/ spec/integrations/test_rails_app`
  end
  
end
