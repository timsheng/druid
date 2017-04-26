require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::CheckBox do
  describe "interface" do
    let(:element) { double 'element' }
    let(:checkbox) { Druid::Elements::CheckBox.new(element) }

    it "should check" do
      expect(element).to receive(:set)
      checkbox.check
    end

    it "should uncheck" do
      expect(element).to receive(:clear)
      checkbox.uncheck
    end

    it "should know if it is checked" do
      expect(element).to receive(:set?)
      checkbox.checked?
    end

    it "should register with type :checkbox" do
      expect(Druid::Elements.element_class_for(:input, :checkbox)).to be Druid::Elements::CheckBox
    end

  end
end
