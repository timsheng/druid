require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Label do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :text, :index, :xpath].each do |t|
        identifier = Druid::Elements::Label.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with tag :label" do
      expect(Druid::Elements.element_class_for(:label)).to be Druid::Elements::Label
    end
  end
end
