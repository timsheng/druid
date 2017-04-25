require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TableCell do
  describe "interface" do
    it "should register with tag_name :td" do
      expect(Druid::Elements.element_class_for(:td)).to be Druid::Elements::TableCell
    end

    it "should register with tag_name :th" do
      expect(Druid::Elements.element_class_for(:th)).to be Druid::Elements::TableCell
    end
  end
end
