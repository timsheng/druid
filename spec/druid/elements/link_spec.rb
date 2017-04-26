require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Link do
  describe "interface" do
    it "should register with tag :a" do
      expect(Druid::Elements.element_class_for(:a)).to be Druid::Elements::Link
    end
  end
end
