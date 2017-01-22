require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Bold do
  let(:bold) { Druid::Elements::Bold}

  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :idenx, :name, :xpath, :css].each do |t|
        identifier = bold.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with tag :b" do
      expect(Druid::Elements.element_class_for(:b)).to eql Druid::Elements::Bold
    end
  end
end
