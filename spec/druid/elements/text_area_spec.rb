require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TextArea do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::TextArea.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end

    it "should map selenium types to watir" do
      identifier = Druid::Elements::TextArea.identifier_for :css => 'value'
      expect(identifier.keys.first).to eql :tag_name
    end
  end

  describe "interface" do
    let(:element) { double "element" }
    let(:text_area) { Druid::Elements::TextArea.new(element) }
    it "should set its' value" do
      expect(element).to receive(:send_keys).with('test')
      text_area.value = 'test'
    end
  end
end
