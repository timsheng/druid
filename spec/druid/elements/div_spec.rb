require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Div do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :text, :index, :xpath, :title].each do |t|
        identifier = Druid::Elements::Div.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with tag :div" do
      expect(Druid::Elements.element_class_for(:div)).to be Druid::Elements::Div
    end
  end
end
