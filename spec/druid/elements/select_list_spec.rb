require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::SelectList do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath, :text, :value].each do |t|
        identifier = Druid::Elements::SelectList.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { double 'element' }
    let(:select_list) { Druid::Elements::SelectList.new(element) }

    it "should return an option when indexed" do
      expect(element).to receive_message_chain(:options, :[]).with(1)
      expect(select_list[1]).to be_instance_of Druid::Elements::Option
    end

    it "should retrieve all values of select_list" do
      expect(element).to receive(:options).and_return(['val1','val2'])
      expect(select_list.options).to eql ['val1','val2']
    end

    it "should select an element" do
      expect(element).to receive(:select).with('test')
      select_list.select('test')
    end

    it "should register with tag_name :select" do
      expect(Druid::Elements.element_class_for(:select)).to be Druid::Elements::SelectList
    end
  end
end
