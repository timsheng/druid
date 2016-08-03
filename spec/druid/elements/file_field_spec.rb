require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::FileField do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath, :title].each do |t|
        identifier = Druid::Elements::FileField.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { double 'element' }
    let(:file_field) { Druid::Elements::FileField.new(element) }

    it "should set its' value" do
      expect(element).to receive(:set).with('a file')
      file_field.value = 'a file'
    end
  end
end
