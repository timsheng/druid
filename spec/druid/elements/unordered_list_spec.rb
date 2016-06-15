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
  end
end
