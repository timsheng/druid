require 'spec_helper'

describe Druid::Elements::Italic do
  let(:italic) { Druid::Elements::Italic}

  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :idenx, :name, :xpath, :css].each do |t|
        identifier = italic.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with tag :i" do
      expect(Druid::Elements.element_class_for(:i)).to eql Druid::Elements::Italic
    end
  end
end
