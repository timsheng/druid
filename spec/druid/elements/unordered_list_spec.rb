require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::UnOrderedList do
  describe "interface" do
    let(:element) { double 'element' }
    let(:ul) { Druid::Elements::UnOrderedList.new(element) }

    it "should return a list item when indexed" do
      allow(element).to receive(:uls).and_return(element)
      expect(element).to receive(:[])
      ul[1]
    end

    it "should know how many items it contains" do
      allow(element).to receive(:uls).and_return([element])
      expect(ul.items).to eql 1
    end

    it "should know how to iterate over the items" do
      expect(ul).to receive(:items).and_return(3)
      allow(ul).to receive(:[])
      count = 0
      ul.each do
        count += 1
      end
      expect(count).to eql 3
    end

    it "should register with tag_name :ul" do
      expect(Druid::Elements.element_class_for(:ul)).to be Druid::Elements::UnOrderedList
    end
  end
end
