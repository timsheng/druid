require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TextField do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :tag_name, :text, :css, :xpath, :title].each do |t|
        identifier = Druid::Elements::TextField.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { double 'element' }
    let(:text_field) { Druid::Elements::TextField.new(element) }

    it "should set its' value" do
      expect(element).to receive(:set).with('test')
      text_field.value = 'test'
    end

    it "should register with type :text" do
      expect(Druid::Elements.element_class_for(:input, :text)).to be Druid::Elements::TextField
    end

    it "should register with type :password" do
      expect(Druid::Elements.element_class_for(:input, :password)).to be Druid::Elements::TextField
    end
  end
end
