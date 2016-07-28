require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Form do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::Form.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { double 'element' }
    let(:driver) { double 'driver' }
    let(:form) { Druid::Elements::Form.new(element, driver) }

    it "should submit a form" do
      expect(element).to receive(:submit)
      form.submit
    end
  end
end
