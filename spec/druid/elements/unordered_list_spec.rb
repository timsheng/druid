require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::UnOrderedList do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :xpath].each do |t|
        identifier = Druid::Elements::UnOrderedList.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { double 'element' }
    let(:ul) { Druid::Elements::UnOrderedList.new(element) }

    it "should return a list item when indexed" do
      expect(element).to receive(:li)
      expect(ul[1]).to be_instance_of Druid::Elements::ListItem
    end

    it "should know how many items it contains" do
      expect(element).to receive_message_chain(:lis, :size).and_return(3)
      expect(ul.items).to eql 3
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
