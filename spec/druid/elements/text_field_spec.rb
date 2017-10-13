require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TextField do
  describe "interface" do
    let(:element) { double 'element' }
    let(:text_field) { Druid::Elements::TextField.new(element) }

    it "should register with type :text" do
      expect(Druid::Elements.element_class_for(:input, :text)).to be Druid::Elements::TextField
    end

    it "should register with type :password" do
      expect(Druid::Elements.element_class_for(:input, :password)).to be Druid::Elements::TextField
    end

    it "should append text" do
      expect(element).to receive(:append).with('abc')
      text_field.append('abc')
    end
  end
end
