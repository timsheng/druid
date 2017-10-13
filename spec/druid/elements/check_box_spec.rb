require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::CheckBox do
  describe "interface" do
    let(:element) { double 'element' }
    let(:checkbox) { Druid::Elements::CheckBox.new(element) }

    it "should register with type :checkbox" do
      expect(Druid::Elements.element_class_for(:input, :checkbox)).to be Druid::Elements::CheckBox
    end

  end
end
