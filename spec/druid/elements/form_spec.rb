require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Form do
  describe "interface" do
    let(:element) { double 'element' }
    let(:form) { Druid::Elements::Form.new(element) }

    it "should submit a form" do
      expect(element).to receive(:submit)
      form.submit
    end

    it "should register with tag_name :form" do
       expect(Druid::Elements.element_class_for(:form)).to be Druid::Elements::Form
    end
  end
end
