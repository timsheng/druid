require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::OrderedList do
  describe "interface" do
    let(:element) { double 'element' }
    let(:ol) { Druid::Elements::OrderedList.new(element) }

    it "should return a list item when indexed" do
      allow(element).to receive(:children).and_return([element, element])
      ol[1]
    end

    it "should know how many list items it contains" do
      allow(element).to receive(:children).and_return([element])
      expect(ol.items).to eql 1
    end

    it "should iterate over the list items" do
      expect(ol).to receive(:list_items).and_return(Array.new(5, element))
      expect(ol.items).to eql 5
    end

    it "should register as tag_name :ol" do
      expect(Druid::Elements.element_class_for(:ol)).to be Druid::Elements::OrderedList
    end
  end
end
