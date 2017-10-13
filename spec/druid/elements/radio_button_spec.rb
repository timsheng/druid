require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::RadioButton do
  describe "interface" do
    let(:element) { double("element") }
    let(:driver) { double("driver") }
    let(:radio) { Druid::Elements::RadioButton.new(element)}

    it "should register as type :radio" do
      expect(Druid::Elements.element_class_for(:input, :radio)).to be Druid::Elements::RadioButton
    end
  end
end
