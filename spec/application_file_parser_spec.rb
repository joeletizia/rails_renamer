require 'spec_helper'

describe RailsRenamer::ApplicationFileParser do
  let(:app_file) { 'file/to/parse' }
  let(:parser) { RailsRenamer::ApplicationFileParser.new(app_file) }

  describe "#application_name" do

    let(:file) { double(:file) }
    let(:file_contents) { %Q[ module DefaultApp
                                class Application < Rails::Application
                                end
                              end] }

    before do
      File.stub(:open).with('file/to/parse', "r") { file }
      file.stub(:read) { file_contents }
    end

    it "returns the appropriate constant defining the application" do
      parser.application_name.should == 'DefaultApp'
    end
  end
end
