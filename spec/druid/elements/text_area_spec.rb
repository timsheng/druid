require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TextArea do
  describe "interface" do
    let(:element) { double "element" }
    let(:text_area) { Druid::Elements::TextArea.new(element) }
    it "should set its' value" do
      expect(element).to receive(:set).with('test')
      text_area.value = 'test'
    end

    it "should register with tag_name :textarea" do
      expect(Druid::Elements.element_class_for(:textarea)).to be Druid::Elements::TextArea
    end
  end
end
