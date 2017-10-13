require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::UnOrderedList do
  describe "interface" do
    let(:element) { double 'element' }
    let(:ul) { Druid::Elements::UnOrderedList.new(element) }

    context "for sub method" do
      before(:each) do
        allow(element).to receive(:children).and_return(Array.new(2, Watir::LI))
      end

      it "should return a list item when indexed" do
        expect(ul[1]).to be_instance_of Druid::Elements::ListItem
      end

      it "should know how many items it contains" do
        expect(ul.items).to eql 2
      end

      it "should know how to iterate over the items" do
        count = 0
        ul.each { count += 1 }
        expect(count).to eql 2
      end
    end


    it "should register with tag_name :ul" do
      expect(Druid::Elements.element_class_for(:ul)).to be Druid::Elements::UnOrderedList
    end
  end
end
