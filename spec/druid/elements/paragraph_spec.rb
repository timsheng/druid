require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Paragraph do
  let(:paragraph) { Druid::Elements::Paragraph }

  describe "interface" do
    it "should register with type :checkbox" do
      expect(Druid::Elements.element_class_for(:p)).to be Druid::Elements::Paragraph
    end
  end
end
