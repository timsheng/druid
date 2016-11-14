require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Span do
  describe "when mapping how to find an element" do
    it "should map watir types to same"  do
      [:class, :id, :index, :xpath, :text].each do |t|
        identifier = Druid::Elements::Span.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with tag_name :span" do
      expect(Druid::Elements.element_class_for(:span)).to be Druid::Elements::Span
    end
  end
end
