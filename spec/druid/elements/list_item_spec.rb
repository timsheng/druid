require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::ListItem do
  describe "interface" do
    it "should register as tag_name :li" do
      expect(Druid::Elements.element_class_for(:li)).to be Druid::Elements::ListItem
    end
  end
end
