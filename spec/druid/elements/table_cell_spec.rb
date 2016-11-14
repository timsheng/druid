require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TableCell do
  describe "when mapping how to find an element" do
    it "should map watir types to same"  do
      [:class, :id, :index, :xpath, :name, :text].each do |t|
        identifier = Druid::Elements::TableCell.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with tag_name :td" do
      expect(Druid::Elements.element_class_for(:td)).to be Druid::Elements::TableCell
    end

    it "should register with tag_name :th" do
      expect(Druid::Elements.element_class_for(:th)).to be Druid::Elements::TableCell
    end
  end
end
