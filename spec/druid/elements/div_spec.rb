require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Div do
  describe "interface" do
    it "should register with tag :div" do
      expect(Druid::Elements.element_class_for(:div)).to be Druid::Elements::Div
    end
  end
end
