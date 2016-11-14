require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Form do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath, :action].each do |t|
        identifier = Druid::Elements::Form.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

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
