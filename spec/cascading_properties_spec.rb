require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CascadingProperties" do
  valid_source1 = <<-EOS
    compiler {
      error {
        message {
          varNotFound "variable not found"
          incompatibleType "incompatible type"
        }
      }
      maxReport 10
      files {
        input.encoding "SJIS"
        output.encoding  "UTF-8"
      }
    }
  EOS

  shared_examples_for "loadin valid_source1" do
    describe "root" do
      subject{ @root }
      its(:compiler){ should be_a(CascadingProperties::Node)}
    end
    describe "compiler" do
      subject{ @root.compiler }
      its(:error){ should be_a(CascadingProperties::Node)}
      its(:maxReport){ should == 10}
      its(:files){ should be_a(CascadingProperties::Node)}
    end
    describe "compiler.error" do
      subject{ @root.compiler.error }
      its(:message){ should be_a(CascadingProperties::Node)}
    end
    describe "compiler.error.message" do
      subject{ @root.compiler.error.message }
      its(:varNotFound){ should == "variable not found"}
      its(:incompatibleType){ should == "incompatible type"}
    end

    describe "compiler.files" do
      subject{ @root.compiler.files }
      its(:input){ should be_a(CascadingProperties::Node)}
      its(:output){ should be_a(CascadingProperties::Node)}
    end
    describe "compiler.files.input" do
      subject{ @root.compiler.files.input }
      its(:encoding){ should == "SJIS" }
    end
    describe "compiler.files.output" do
      subject{ @root.compiler.files.output }
      its(:encoding){ should == "UTF-8" }
    end
  end

  describe :load do
    before do
      @root = CascadingProperties.load(valid_source1)
    end
    it_should_behave_like "loadin valid_source1"
  end
end
