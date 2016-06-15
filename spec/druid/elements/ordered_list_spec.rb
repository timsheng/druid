require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::OrderedList do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :xpath].each do |t|
        identifier = Druid::Elements::OrderedList.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { double 'element' }
    let(:ol) { Druid::Elements::OrderedList.new(element) }

    it "should return a list item when indexed" do
      expect(element).to receive(:li)
      expect(ol[1]).to be_instance_of Druid::Elements::ListItem
    end
  end
end
