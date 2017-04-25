require 'spec_helper'

describe Druid::Elements::Italic do
  let(:italic) { Druid::Elements::Italic}
  
  describe "interface" do
    it "should register with tag :i" do
      expect(Druid::Elements.element_class_for(:i)).to eql Druid::Elements::Italic
    end
  end
end
