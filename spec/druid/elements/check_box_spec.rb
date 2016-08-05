require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::CheckBox do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath, :value].each do |t|
        identifier = Druid::Elements::CheckBox.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { double 'element' }
    let(:checkbox) { Druid::Elements::CheckBox.new(element) }

    it "should check" do
      expect(element).to receive(:set)
      checkbox.check
    end

    it "should uncheck" do
      expect(element).to receive(:clear)
      checkbox.uncheck
    end

    it "should know if it is checked" do
      expect(element).to receive(:set?)
      checkbox.checked?
    end
  end
end
