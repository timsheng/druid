require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Paragraph do
  let(:paragraph) { Druid::Elements::Paragraph }

  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = paragraph.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with type :checkbox" do
      expect(Druid::Elements.element_class_for(:p)).to be Druid::Elements::Paragraph
    end
  end
end
