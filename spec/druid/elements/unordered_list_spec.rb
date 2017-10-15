require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::UnOrderedList do
  let(:ul) { Druid::Elements::UnOrderedList.new(ul_element) }

  describe "interface" do
    let(:ul_element) { double('ul_element').as_null_object }
    let(:li_element) { double('li_element').as_null_object }

    it "should register with tag_name :ul" do
      expect(Druid::Elements.element_class_for(:ul)).to be Druid::Elements::UnOrderedList
    end

    context "for sub method" do
      before(:each) do
        allow(ul_element).to receive(:children).and_return([li_element, li_element])
        allow(li_element).to receive(:tag_name).and_return(:li)
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



  end
end
