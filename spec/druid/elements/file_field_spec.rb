require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::FileField do
  describe "interface" do
    let(:element) { double 'element' }
    let(:file_field) { Druid::Elements::FileField.new(element) }

    it "should register as type :file" do
      expect(Druid::Elements.element_class_for(:input, :file)).to be Druid::Elements::FileField
    end
  end
end
