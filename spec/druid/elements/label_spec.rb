require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Label do
  describe "interface" do
    it "should register with tag :label" do
      expect(Druid::Elements.element_class_for(:label)).to be Druid::Elements::Label
    end
  end
end
