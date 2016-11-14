require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Heading do
  describe "When mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::Heading.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with tag :h1" do
      expect(Druid::Elements.element_class_for(:h1)).to be Druid::Elements::Heading
    end

    it "should register with tag :h2" do
      expect(Druid::Elements.element_class_for(:h2)).to be Druid::Elements::Heading
    end

    it "should register with tag :h3" do
      expect(Druid::Elements.element_class_for(:h3)).to be Druid::Elements::Heading
    end

    it "should register with tag :h4" do
      expect(Druid::Elements.element_class_for(:h4)).to be Druid::Elements::Heading
    end

    it "should register with tag :h5" do
      expect(Druid::Elements.element_class_for(:h5)).to be Druid::Elements::Heading
    end

    it "should register with tag :h6" do
      expect(Druid::Elements.element_class_for(:h6)).to be Druid::Elements::Heading
    end
  end
end
