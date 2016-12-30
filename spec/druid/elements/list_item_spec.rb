require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::ListItem do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath, :text].each do |t|
        identifier = Druid::Elements::ListItem.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register as tag_name :li" do
      expect(Druid::Elements.element_class_for(:li)).to be Druid::Elements::ListItem
    end
  end
end
