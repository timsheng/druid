require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::HiddenField do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath, :value].each do |t|
        identifier = Druid::Elements::HiddenField.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end

    it "should map selenium types to watir" do
      identifier = Druid::Elements::HiddenField.identifier_for :css => 'value'
      expect(identifier.keys.first).to eql :tag_name
    end
  end

  describe "interface" do
    it "should register with type :hidden" do
      expect(Druid::Elements.element_class_for(:input, :hidden)).to be Druid::Elements::HiddenField
    end
  end
end
