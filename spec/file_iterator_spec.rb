require 'spec_helper'

describe RailsRenamer::FileIterator do
  before do
    RailsRenamer::FileRepository.stub(:files_to_rename) { files }
  end

  describe '#parse_all' do
    let(:file_repository) { RailsRenamer::FileRepository }
    let(:iterator) { RailsRenamer::FileIterator.new(file_repository, 'bar') }
    let(:files) { ['foo1', 'foo2'] }

    it "parses and replaces the application name in all files" do
      files.each do |file|
        RailsRenamer::ContentReplacer.should_receive(:find_and_replace_application_name).with(file, 'bar')
      end

      iterator.parse_all
    end
  end
  
end
