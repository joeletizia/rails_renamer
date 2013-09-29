require 'spec_helper'

describe RailsRenamer::OriginalNameLocator do
  describe "original_name" do
    let(:parser) { double(:parser) }

    it "uses the ApplicationFileParser to return the app name" do
      RailsRenamer::ApplicationFileParser.stub(:new) { parser }
      parser.stub(:application_name) { 'bar' }

      RailsRenamer::OriginalNameLocator.original_name.should == 'bar'
    end
  end
end
