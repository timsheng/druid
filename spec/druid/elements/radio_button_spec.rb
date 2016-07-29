require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::RadioButton do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::RadioButton.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { double("element") }
    let(:driver) { double("driver") }
    let(:radio) { Druid::Elements::RadioButton.new(element)}

    it "should select" do
      expect(element).to receive(:set)
      radio.select
    end

    it "should clear" do
      expect(element).to receive(:clear)
      radio.clear
    end

    it "should know if it is selected" do
      expect(element).to receive(:set?)
      radio.selected?
    end
  end
end
