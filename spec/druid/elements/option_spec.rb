require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Option do
  describe "interface" do
    it "should register as tag_name :option" do
      expect(Druid::Elements.element_class_for(:option)).to be Druid::Elements::Option
    end
  end
end
