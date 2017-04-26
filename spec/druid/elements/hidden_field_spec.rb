require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::HiddenField do
  describe "interface" do
    it "should register with type :hidden" do
      expect(Druid::Elements.element_class_for(:input, :hidden)).to be Druid::Elements::HiddenField
    end
  end
end
