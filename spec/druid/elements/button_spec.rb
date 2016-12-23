require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Button do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :value, :xpath, :src, :alt, :css].each do |t|
        identifier = Druid::Elements::Button.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    it "should register with type :submit" do
      expect(Druid::Elements.element_class_for(:input, :submit)).to be Druid::Elements::Button
    end

    it "should register with type :image" do
      expect(Druid::Elements.element_class_for(:input, :image)).to be Druid::Elements::Button
    end

    it "should register with type :button" do
      expect(Druid::Elements.element_class_for(:input, :button)).to be Druid::Elements::Button
    end

    it "should register with type :reset" do
      expect(Druid::Elements.element_class_for(:input, :reset)).to be Druid::Elements::Button
    end
  end
end
