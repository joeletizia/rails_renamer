require 'spec_helper'

describe RailsRenamer::ContentReplacer do

  describe "#find_and_replace_application_name" do
    let(:file_contents) { "BAZ baz foo FOO Foo" }
    let(:file) { double(:file, read: file_contents, write: nil, close: nil) }

    before do
      File.stub(:open).with('file/to/parse', 'r') { file }
      File.stub(:open).with('file/to/parse', 'w') { file }
      File.stub(:delete)
    end

    it "replaces the existing file name with the given name" do
      file_contents.should_receive(:gsub!).with('Foo', 'Bar')

      RailsRenamer::ContentReplacer.
        find_and_replace_application_name('file/to/parse', 'Foo', 'Bar')
    end

    it "returns the contents of the file" do
      new_contents = RailsRenamer::ContentReplacer.
        find_and_replace_application_name('file/to/parse', 'Foo', 'Bar')

      new_contents.should == "BAZ baz foo FOO Bar"  
    end

    it "deletes the file" do
      File.should_receive(:delete)
      RailsRenamer::ContentReplacer.
        find_and_replace_application_name('file/to/parse', 'Foo', 'Bar')
    end

  end

end
