require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Area do
  context "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::Area.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  context "implementation" do
    let(:element) { double('element') }
    let(:area) { Druid::Elements::Area.new(element) }

    it "should know its coords" do
      expect(element).to receive(:attribute_value).with(:coords).and_return("1,2,3,4")
      expect(area.coords).to eql "1,2,3,4"
    end

    it "should know its shape" do
      expect(element).to receive(:attribute_value).with(:shape).and_return("circle")
      expect(area.shape).to eql "circle"
    end

    it "should know its href" do
      expect(element).to receive(:attribute_value).with(:href).and_return("twitter.com")
      expect(area.href).to eql "twitter.com"
    end
  end
end
