require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Bold do
  let(:bold) { Druid::Elements::Bold}

  describe "interface" do
    it "should register with tag :b" do
      expect(Druid::Elements.element_class_for(:b)).to eql Druid::Elements::Bold
    end
  end
end
